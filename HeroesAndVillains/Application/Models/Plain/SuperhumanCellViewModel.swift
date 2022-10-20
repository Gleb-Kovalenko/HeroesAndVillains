//
//  SuperhumanCellViewModel.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 05.10.2022.
//

import Foundation

// MARK: - SuperhumanCellViewModel

public struct SuperhumanCellViewModel: SuperhumanCellViewModelProtocol {
    
    // MARK: - Properties
    
    let superhuman: SuperhumanPlainObject
    
    public var name: String {
        superhuman.name
    }
    
    public var isFavorite = false
    
    public var stats: [StatPlainObject] {
        superhuman.stats
    }
    
    public var imageUrl: URL {
        superhuman.image
    }
}
