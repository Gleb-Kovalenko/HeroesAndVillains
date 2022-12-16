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
        UniqueID(rawValue: name)
    }
    
    /// Superhuman's name
    let name: String
    
    /// Superhuman's type: superhero, supervillains, etc.
    let type: SuperhumanType
    
    /// URL of image with superhuman
    let imageURL: URL
    
    /// Background color of superhuman's card
    let backgroundColorHex: String
    
    /// Superhuman stats instance
    let stats: [StatPlainObject]
}
