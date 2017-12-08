//
//  GameOutput.swift
//  LifeGame
//
//  Created by Anton Muratov on 12/8/17.
//  Copyright © 2017 Anton Muratov. All rights reserved.
//

protocol GameOutput {
    func print(_ error: Error)
    func print(_ value: String)
}
