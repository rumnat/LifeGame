//
//  FIeldCell.swift
//  LifeGame
//
//  Created by Anton Muratov on 12/8/17.
//  Copyright © 2017 Anton Muratov. All rights reserved.
//

extension Field {
    class Cell {
        var isEmpty: Bool = true
    }
}

// MARK: - Equatable

extension Field.Cell: Equatable {
    static func ==(lhs: Field.Cell, rhs: Field.Cell) -> Bool {
        return lhs === rhs
    }
}
