//
//  SuperhumanPlainObject.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 04.10.2022.
//

import Foundation
import SDAO

// MARK: - SuperhumanPlainObject

public struct SuperhumanPlainObject: Decodable, Plain {
    
    // MARK: - Properties
    
    /// Unique id for each superhuman
    public var uniqueId: UniqueID {
        UniqueID(rawValue: name + String(type.rawValue))
    }
    
    /// Superhuman's name
    let name: String
    
    /// Superhuman's type: superhero, supervillains, etc.
    let type: SuperhumanType
    
    /// URL of image with superhuman
    let imageURL: URL
    
    /// Flag, that indicates is this superhuman in favorite list
    let isFavorite: Bool
    
    /// Background color of superhuman's card
    let backgroundColorHex: String
    
    /// Superhuman stats instance
    let stats: [StatPlainObject]
    
    /// Toggle superhuman favorite state
    func toggleFavorite() -> SuperhumanPlainObject {
        SuperhumanPlainObject(
            name: self.name,
            type: self.type,
            imageURL: self.imageURL,
            isFavorite: !self.isFavorite,
            backgroundColorHex: self.backgroundColorHex,
            stats: self.stats
        )
    }
}
