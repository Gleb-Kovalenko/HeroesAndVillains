//
//  SuperhumanInfoInteractorOutput.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 15/12/2022.
//

import VIPER

// MARK: - SuperhumanInfoInteractorOutput

public protocol SuperhumanInfoInteractorOutput: InteractorOutput {
    
    /// Superhuman favorite state change was succces
    /// - Parameters:
    ///    - updatedData: updated superhuman plain object
    func favoriteToogleSuccess(updatedData: SuperhumanInfoModule.Data)
}
