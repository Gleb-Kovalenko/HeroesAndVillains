//
//  SuperumanServiceImplementation.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 02.11.2022.
//

import Foundation
import ServiceCore
import SDAO
import Monreau

// MARK: - SuperumanServiceImplementation

public final class SuperumanServiceImplementation: Service {
    
    // MARK: - Properties
    
    private let superhumanDAO: SuperhumanDAO
    
    /// Default initializer
    /// - Parameters:
    ///   - superhumanDAO: superhuman dao instance
    init(superhumanDAO: SuperhumanDAO) {
        self.superhumanDAO = superhumanDAO
    }
}

// MARK: - SuperhumanService

extension SuperumanServiceImplementation: SuperhumanService {
    
    public func obtain(with filter: SuperhumanType) -> ServiceCall<[SuperhumanPlainObject]> {
        createCall {
            guard let fileUrl = Bundle.main.url(forResource: "SuperhumansInfo", withExtension: "json") else {
                return .success([])
            }
            let data = try Data(contentsOf: fileUrl)
            let plains = try data.jsonDecoded() as [SuperhumanPlainObject]
            try self.superhumanDAO.persist(plains)
            return .success(plains.filter{ $0.type == filter })
        }
    }
    
    public func obtainCache(with filter: SuperhumanType) throws -> [SuperhumanPlainObject] {
        try superhumanDAO.read(predicatedBy: "type == \(filter.rawValue)")
    }
    
    public func obtainCache(with filter: SuperhumanType, isFavoriteFilterActive: Bool) throws -> [SuperhumanPlainObject] {
        try superhumanDAO.read(predicatedBy: "type == \(filter.rawValue) and isFavotire == \(isFavoriteFilterActive)")
    }
    
    public func toogleFavorite(superhumanID: UniqueID) -> ServiceCall<SuperhumanPlainObject> {
        createCall {
            do {
                let superhumanPlain = try self.superhumanDAO.read(byPrimaryKey: superhumanID)
                let updatedSuperhumanPlain = superhumanPlain?.toogleFavorite()
                guard let updatedSuperhumanPlain = updatedSuperhumanPlain else {
                    return .failure(NSError(domain:"Bad error:(", code: 666, userInfo:nil))
                }
                try self.superhumanDAO.persist(updatedSuperhumanPlain)
                return .success(updatedSuperhumanPlain)
            } catch {
                return .failure(error)
            }
        }
    }
}
