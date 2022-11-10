//
//  Data.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 10.11.2022.
//

import Foundation

// MARK: - Data

extension Data {

    /// Decode this data into a value, optionally using a specific decoder.
    /// If no explicit encoder is passed, then the data is decoded as JSON.
    func jsonDecoded<T: Decodable>(as type: T.Type = T.self, using decoder: JSONDecoder = JSONDecoder()) throws -> T {
        try decoder.decode(T.self, from: self)
    }
}
