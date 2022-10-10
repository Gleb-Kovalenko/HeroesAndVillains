//
//  StatTranslator.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 06.10.2022.
//

import Foundation
import SDAO
import Monreau

// MARK: - StatTranslator

final class StatTranslator {
    
    typealias PlainModel = StatPlainObject
    typealias DatabaseModel = StatDatabaseModel
    
    private lazy var statStorage = RealmStorage<StatDatabaseModel>(configuration: self.configuration)
    
    private let configuration: RealmConfiguration
    
    init(configuration: RealmConfiguration) {
        self.configuration = configuration
    }
}

extension StatTranslator: Translator {
    
    func translate(model: StatDatabaseModel) throws -> StatPlainObject {
        StatPlainObject(
            longName: model.longName,
            shortName: model.shortName,
            value: model.value
        )
    }
    
    func translate(plain: StatPlainObject) throws -> StatDatabaseModel {
        let model = try statStorage.read(byPrimaryKey: plain.uniqueId.rawValue) ?? StatDatabaseModel()
        try translate(from: plain, to: model)
        return model
    }
    
    func translate(from plain: StatPlainObject, to databaseModel: StatDatabaseModel) throws {
        if databaseModel.uniqueId.isEmpty {
            databaseModel.uniqueId = plain.uniqueId.rawValue
        }
        databaseModel.shortName = plain.shortName
        databaseModel.longName = plain.longName
        databaseModel.value = plain.value
    }
}
