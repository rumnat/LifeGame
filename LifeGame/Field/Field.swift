//
//  Field.swift
//  LifeGame
//
//  Created by Anton Muratov on 12/8/17.
//  Copyright © 2017 Anton Muratov. All rights reserved.
//

import Foundation

class Field {
    fileprivate var fieldGrid: [Cell]
    let rowsNumber: Int
    let columnsNumber: Int
    
    // MARK: - Init
    
    init(rowsNumber: Int, columnsNumber: Int) {
        self.rowsNumber = rowsNumber
        self.columnsNumber = columnsNumber
        let count = rowsNumber * columnsNumber
        self.fieldGrid = Array(repeating: Cell(), count: count)
        for row in 0 ..< rowsNumber {
            for column in 0 ..< columnsNumber {
                self[row, column] = Cell()
            }
        }
    }
    
    // MARK: - Subscript
    
    subscript(row: Int, column: Int) -> Cell {
        get { return fieldGrid[(row * columnsNumber) + column] }
        set { fieldGrid[(row * columnsNumber) + column] = newValue }
    }
    
    // MARK: - Actions
    
    func clear() {
        for cell in fieldGrid {
            cell.isEmpty = true
        }
    }
    
    func adjacentCells(for cell: Cell) -> [Cell] {
        guard let index = index(of: cell) else { return [] }
        var adjacentCells: [Cell] = []
        
        if index.row > 0 {
            if index.column > 0 {
                adjacentCells.append(self[index.row - 1, index.column - 1])
            }
            if index.column < columnsNumber - 2 {
                adjacentCells.append(self[index.row - 1, index.column + 1])
            }
            adjacentCells.append(self[index.row - 1, index.column])
        }
        
        if index.row < rowsNumber - 2 {
            if index.column > 0 {
                adjacentCells.append(self[index.row + 1, index.column - 1])
            }
            if index.column < columnsNumber - 2 {
                adjacentCells.append(self[index.row + 1, index.column + 1])
            }
            adjacentCells.append(self[index.row + 1, index.column])
        }
        
        if index.column > 0 {
            adjacentCells.append(self[index.row, index.column - 1])
        }
        if index.column < columnsNumber - 2 {
            adjacentCells.append(self[index.row, index.column + 1])
        }
        
        return adjacentCells
    }
    
    func getPrintState() -> String {
        var string = String()
        
        for row in 0 ..< rowsNumber {
            for column in 0 ..< columnsNumber {
                let symbol = self[row, column].isEmpty ? "0" : "1"
                string += symbol + "\t"
            }
            string += "\n\n"
        }
        return string
    }
    
    // MARK: - Private
    
    func index(of cell: Cell) -> (row: Int, column: Int)? {
        for row in 0 ..< rowsNumber {
            for column in 0 ..< columnsNumber {
                if cell == self[row, column] {
                    return (row, column)
                }
            }
        }
        
        return nil
    }
}

// MARK: - Sequence

extension Field: Sequence {
    func makeIterator() -> IndexingIterator<[Cell]> {
        return fieldGrid.makeIterator()
    }
}
