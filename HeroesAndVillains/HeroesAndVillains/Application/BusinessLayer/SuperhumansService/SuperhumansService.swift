//
//  SuperhumansService.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 05.10.2022.
//

import Foundation

// MARK: - SuperhumansService

protocol SuperhumansService {
    
    /// Obtain superhumans elements
    func obtain() throws -> [SuperhumanPlainObject]
}
