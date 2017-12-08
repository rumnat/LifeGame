//
//  LogOutput.swift
//  LifeGame
//
//  Created by Anton Muratov on 12/8/17.
//  Copyright © 2017 Anton Muratov. All rights reserved.
//

import Foundation

struct LogOutput: GameOutput {
    func print(_ error: Error) {
        let errorMessage = "\n" + error.localizedDescription + "\n"
        Swift.print(errorMessage)
    }
    
    func print(_ value: String) {
        let message = "\n" + "NEW GENERATION" + "\n\n" + value + "\n"
        Swift.print(message)
    }
}
