//
//  GameEnvironment.swift
//  LifeGame
//
//  Created by Anton Muratov on 12/8/17.
//  Copyright © 2017 Anton Muratov. All rights reserved.
//

import Foundation

protocol GameEnvironment {
    init(configuration: GameEnvironmentConfiguration)
    
    var configuration: GameEnvironmentConfiguration { get }
    
    func blessNewKovcheg(entitiesNumber: Int) throws
    func startNextLifecycleStep()
    func nucleanBomb()
    func getPrintState() -> String
}
