//
//  StatPlainObject.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 01.11.2022.
//

import Foundation
import SDAO

// MARK: - StatPlainObject

public struct StatPlainObject: Decodable, Plain {
    
    // MARK: - Properties
    
    /// Unique id of stat
    public var uniqueId: UniqueID {
        UniqueID(rawValue: longName + String(value))
    }
    
    /// Stat's long name ("speed", for example)
    let longName: String
    
    /// Stat's short name ("spd", for example)
    let shortName: String
    
    /// Integer stat's value
    let value: Int
}
