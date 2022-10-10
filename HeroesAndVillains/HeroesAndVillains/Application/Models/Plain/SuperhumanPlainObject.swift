//
//  SuperhumanPlainObject.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 04.10.2022.
//

import Foundation
import SDAO

// MARK: - SuperhumanPlainObject

struct SuperhumanPlainObject: Decodable, Plain {
    var uniqueId: UniqueID {
        .init(rawValue: name + type)
    }
    let name: String
    let type: String
    let image: URL
    let stats: [StatPlainObject]
}

// MARK: - Stat

public struct StatPlainObject: Decodable, Plain {
    public var uniqueId: UniqueID {
        .init(rawValue: longName + String(value))
    }
    let longName: String
    let shortName: String
    let value: Int
}
