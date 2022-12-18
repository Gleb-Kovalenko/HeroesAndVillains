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
    public let superhuman: SuperhumanPlainObject
    
    /// Superhuman's name instance
    public var name: String {
        superhuman.name
    }
    
    /// Flag, that indicates is this superhuman in favorite list
    public var isFavorite: Bool
    
    /// Superhuman stats instance
    public var stats: [StatPlainObject] {
        superhuman.stats
    }
    
    /// URL of image with superhuman
    public var imageURL: URL {
        superhuman.imageURL
    }
    
    /// Background color of superhuman's card
    public var backgroundColorHex: String {
        superhuman.backgroundColorHex
    }
    
    // MARK: - Initializers

    /// Default initializer
    /// - Parameters:
    ///   - superhumanPlainObject: SuperhumanPlainObject instance
    public init(superhumanPlainObject: SuperhumanPlainObject) {
        self.superhuman = superhumanPlainObject
        isFavorite = superhuman.isFavorite
    }
}
