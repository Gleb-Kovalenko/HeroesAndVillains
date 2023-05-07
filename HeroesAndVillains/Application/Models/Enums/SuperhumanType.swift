//
//  SuperhumanType.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 16.12.2022.
//

import Foundation

// MARK: - SuperhumanType

public enum SuperhumanType: Int, Decodable, CaseIterable {
    
    // MARK: - Cases
    
    case heroes
    case villains
    
    // MARK: - Useful
    
    var title: String {
        switch self {
        case .heroes:
            return "Superheroes"
        case .villains:
            return "Supervillains"
        }
    }
    
    var tabImageName: String {
        switch self {
        case .villains:
            return "Supervillains"
        case .heroes:
            return "Superheroes"
        }
    }
}
