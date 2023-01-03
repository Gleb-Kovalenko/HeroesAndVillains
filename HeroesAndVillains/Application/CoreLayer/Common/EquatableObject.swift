//
//  EquatableObject.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 29.12.2022.
//

import Foundation

// MARK: - EquatableObject

protocol EquatableObject {
    
    /// Comparing two objects for equality
    /// - Parameters:
    ///    - other: another object to compare
    /// - Returns: boolean, indicating is objects equals
    func isEqual(to other: Self) -> Bool
}
