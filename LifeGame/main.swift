//
//  main.swift
//  LifeGame
//
//  Created by Anton Muratov on 12/7/17.
//  Copyright © 2017 Anton Muratov. All rights reserved.
//

let gameConfiguration = GameEnvironmentConfiguration(rowsNumber: 200, columnsNumber: 100)
let gameEnvironment: GameEnvironment = FieldEnvironment(configuration: gameConfiguration)

let gameOutput: GameOutput = LogOutput()

let lifeGame = LifeGame(gameEnvironment: gameEnvironment, gameOutput: gameOutput)
lifeGame.startGame(lifecyclesNumber: 5000)
