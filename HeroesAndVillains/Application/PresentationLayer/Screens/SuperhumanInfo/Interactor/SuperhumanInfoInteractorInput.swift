//
//  SuperhumanInfoInteractorInput.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 15/12/2022.
//

import SDAO

// MARK: - SuperhumanInfoInteractorInput

public protocol SuperhumanInfoInteractorInput {
    
    /// Toogle superhuman favorite state
    func toogleFavorite(superhumanId: UniqueID, currentState: Bool)
}
