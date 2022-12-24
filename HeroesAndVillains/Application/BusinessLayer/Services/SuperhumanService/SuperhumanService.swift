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
    
    /// Toogle superhuman favorite
    func toogleFavorite(superhumanID: UniqueID) -> ServiceCall<SuperhumanPlainObject>
    
    /// Obtain cache with superhumans that have needed favorite state
    func obtainCache(with filter: SuperhumanType, isFavoriteFilterActive: Bool) throws -> [SuperhumanPlainObject]
}
