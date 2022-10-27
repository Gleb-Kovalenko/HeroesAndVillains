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
    
    /// Superhuman object instance
    let superhuman: SuperhumanPlainObject
    
    /// Superhuman's name instance
    public var name: String {
        superhuman.name
    }
    
    /// Flag, that indicates is this superhuman in favorite list
    public var isFavorite = false
    
    /// Superhuman stats instance
    public var stats: [StatPlainObject] {
        superhuman.stats
    }
    
    /// Url of image with superhuman
    public var imageUrl: URL {
        superhuman.image
    }
    
    /// Background color of superhuman's card
    public var backgroundColorHex: String {
        superhuman.backgroundColorHex
    }
}
