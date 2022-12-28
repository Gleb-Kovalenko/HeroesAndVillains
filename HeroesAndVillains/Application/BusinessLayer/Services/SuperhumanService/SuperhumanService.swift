//
//  SuperhumanService.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 02.11.2022.
//

import Foundation
import ServiceCore
import SDAO

// MARK: - SuperhumanService

public protocol SuperhumanService {
    
    /// Obtain all superhumans
    func obtain(with filter: SuperhumanType) -> ServiceCall<[SuperhumanPlainObject]>
    
    /// Obtain cache with superhumans
    func obtainCache(with filter: SuperhumanType) throws -> [SuperhumanPlainObject]
    
    /// Toggle superhuman favorite
    func toggleFavorite(superhumanID: UniqueID) -> ServiceCall<SuperhumanPlainObject>
    
    /// Obtain favorite superhumans
    func obtainFavorites(with filter: SuperhumanType) throws -> [SuperhumanPlainObject]
}
