//
//  SuperhumanListInteractorInput.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 02.11.2022.
//

import Foundation

// MARK: - SuperhumanListInteractorInput

public protocol SuperhumanListInteractorInput {
    
    /// Obtain all available superhumans
    func obtainSuperhumans()
    
    /// Obtain all superumans with favorite state
    func obtainSuperhumans(with isFavoriteFilterActive: Bool)
}
