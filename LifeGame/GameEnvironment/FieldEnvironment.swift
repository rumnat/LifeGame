//
//  FieldEnvironment.swift
//  LifeGame
//
//  Created by Anton Muratov on 12/8/17.
//  Copyright © 2017 Anton Muratov. All rights reserved.
//

import Foundation

class FieldEnvironment: GameEnvironment {
    let configuration: GameEnvironmentConfiguration
    private var field: Field
    
    required init(configuration: GameEnvironmentConfiguration) {
        self.configuration = configuration
        self.field = Field(rowsNumber: configuration.rowsNumber, columnsNumber: configuration.columnsNumber)
    }
    
    func blessNewKovcheg(entitiesNumber: Int) throws {
        let fieldSize = configuration.rowsNumber * configuration.columnsNumber
        guard entitiesNumber <= fieldSize else { throw GameEnvironmentError.cannotContainsMuchEntities }
        
        var burnedEntitiesNumber = 0
        while burnedEntitiesNumber < entitiesNumber {
            let rowIndexToBurnNewLife: Int = Int(arc4random_uniform(UInt32(configuration.rowsNumber)))
            let columnIndexToBurnNewLife: Int = Int(arc4random_uniform(UInt32(configuration.columnsNumber)))
            
            if field[rowIndexToBurnNewLife, columnIndexToBurnNewLife].isEmpty {
                field[rowIndexToBurnNewLife, columnIndexToBurnNewLife].isEmpty = false
                burnedEntitiesNumber += 1
            }
        }
    }
    
    func startNextLifecycleStep() {
        for cell in field {
            let adjacentCells = field.adjacentCells(for: cell)
            let liveNeighborNumber = adjacentCells.filter{ !$0.isEmpty }.count
            let shouldBornNewLife = liveNeighborNumber == 3
            let isHunger = liveNeighborNumber < 2
            let isOverpopulation = liveNeighborNumber > 3
            let shouldDie = isHunger || isOverpopulation
            
            if cell.isEmpty {
                cell.isEmpty = !shouldBornNewLife
            } else {
                cell.isEmpty = shouldDie
            }
        }
    }
    
    func nucleanBomb() {
        field.clear()
    }
    
    func getPrintState() -> String {
        return field.getPrintState()
    }
}
