//
//  SuperhumanListInteractorOutput.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 02.11.2022.
//

import Foundation
import VIPER

// MARK: - SuperhumanListInteractorOutput

public protocol SuperhumanListInteractorOutput: InteractorOutput {

    /// Superhumans was successfully obtained
    /// - Parameter superhumans: obtained superhumans
    func obtainSuperhumanSuccess(_ superhumans: [SuperhumanPlainObject])
}
