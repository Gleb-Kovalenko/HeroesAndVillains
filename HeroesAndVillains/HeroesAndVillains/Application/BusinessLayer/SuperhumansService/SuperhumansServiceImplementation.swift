//
//  SuperhumansServiceImplementation.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 05.10.2022.
//

import Foundation
import Monreau

let realmConfiguration = RealmConfiguration(
    databaseFileName: "Privet.realm",
    databaseVersion: 1
)

// MARK: - SuperhumansServiceImplementation

final class SuperhumansServiceImplementation {
    
    private let statDao = StatDao(
        storage: .init(configuration: realmConfiguration),
        translator: StatTranslator(configuration: realmConfiguration)
    )
}

// MARK: - SuperhumansService

extension SuperhumansServiceImplementation: SuperhumansService {
    
    public func obtain() throws -> [SuperhumanPlainObject] {
        
        let decoder = JSONDecoder()
        guard let fileUrl = Bundle.main.url(forResource: "SuperhumansInfo", withExtension: "json") else {
            throw RuntimeError.cantOpenJsonFile
        }
        guard let data = try? Data(contentsOf: fileUrl) else {
            throw RuntimeError.cantLoadJsonFile
        }
        do {
            let plains = try decoder.decode([SuperhumanPlainObject].self, from: data)
            try statDao.persist(plains.map(\.stats).flatMap { $0 })
            return plains
        } catch {
            throw RuntimeError.parseError
        }
    }
    
    public func obtainCache() throws -> [StatPlainObject] {
        let plainsStat = try statDao.read()
        return plainsStat
    }
}
