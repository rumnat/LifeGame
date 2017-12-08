//
//  LifeGame.swift
//  LifeGame
//
//  Created by Anton Muratov on 12/8/17.
//  Copyright © 2017 Anton Muratov. All rights reserved.
//

class LifeGame {
    private let gameEnvironment: GameEnvironment
    private let gameOutput: GameOutput
    private(set) var currentLifecycleStep: Int
    
    // MARK: - Init
    
    init(gameEnvironment: GameEnvironment, gameOutput: GameOutput) {
        self.gameEnvironment = gameEnvironment
        self.gameOutput = gameOutput
        self.currentLifecycleStep = 0
    }
    
    // MARK: - Actions
    
    func startGame(lifecyclesNumber: Int) {
        generateInitialEntities()
        startGameLifecycle(stepsNumber: lifecyclesNumber)
    }
    
    // MARK: - Private
    
    private func generateInitialEntities() {
        do {
            let size = gameEnvironment.configuration.columnsNumber * gameEnvironment.configuration.rowsNumber
            let entitiesNumber = size * 2 / 3
            try gameEnvironment.blessNewKovcheg(entitiesNumber: entitiesNumber)
        } catch let error {
            gameOutput.print(error)
        }
    }
    
    private func startGameLifecycle(stepsNumber: Int) {
        while currentLifecycleStep < stepsNumber {
            gameOutput.print(gameEnvironment.getPrintState())
            
            gameEnvironment.startNextLifecycleStep()
            currentLifecycleStep += 1
        }
    }
    
    private func finishGame() {
        currentLifecycleStep = 0
        gameEnvironment.nucleanBomb()
    }
}
