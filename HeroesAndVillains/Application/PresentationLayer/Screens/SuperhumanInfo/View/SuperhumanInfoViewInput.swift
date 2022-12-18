//
//  SuperhumanInfoViewInput.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 15/12/2022.
//

// MARK: - SuperhumanInfoViewInput

public protocol SuperhumanInfoViewInput: AnyObject {

    /// Setup initial view state
    func setupInitialState()
    
    /// Undo favorite state if has handled error while changing state
    func undoFavoriteStateChange()
}
