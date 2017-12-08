//
//  GameEnvironmentError.swift
//  LifeGame
//
//  Created by Anton Muratov on 12/8/17.
//  Copyright © 2017 Anton Muratov. All rights reserved.
//

import Foundation

enum GameEnvironmentError {
    case custom(String)
    case cannotContainsMuchEntities
}

// MARK: - LocalizedError

extension GameEnvironmentError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .custom(let errorMessage):
            return errorMessage
        case .cannotContainsMuchEntities:
            return "The field cannot contain too much entities"
        }
    }
}
