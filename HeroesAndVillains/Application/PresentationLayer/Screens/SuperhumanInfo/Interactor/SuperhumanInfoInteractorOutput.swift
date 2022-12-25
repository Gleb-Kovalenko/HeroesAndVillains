//
//  SuperhumanInfoInteractorOutput.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 15/12/2022.
//

import VIPER

// MARK: - SuperhumanInfoInteractorOutput

public protocol SuperhumanInfoInteractorOutput: InteractorOutput {
    
    /// Superhuman favorite status changed successfully
    /// - Parameters:
    ///    - updatedData: updated superhuman plain object
    func favoriteToggleSuccess(updatedData: SuperhumanInfoModule.Data)
}
