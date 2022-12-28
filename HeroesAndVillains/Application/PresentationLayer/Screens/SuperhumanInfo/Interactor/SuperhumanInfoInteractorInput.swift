//
//  SuperhumanInfoInteractorInput.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 15/12/2022.
//

import SDAO

// MARK: - SuperhumanInfoInteractorInput

public protocol SuperhumanInfoInteractorInput {
    
    /// Toggle superhuman favorite state
    func toggleFavorite(superhumanId: UniqueID)
}
