//
//  SuperhumanTranslator.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 17.12.2022.
//

import Foundation
import SDAO
import Monreau

// MARK: - SuperhumanTranslator

public final class SuperhumanTranslator {
    
    // MARK: - Aliases
    
    public typealias PlainModel = SuperhumanPlainObject
    public typealias DatabaseModel = SuperhumanDatabaseModel
    
    // MARK: - Properties
    
    private lazy var superhumanStorage = RealmStorage<SuperhumanDatabaseModel>(configuration: self.configuration)
    private let configuration: RealmConfiguration
    
    /// Default initializer
    /// - Parameters:
    ///   - configuration: realm configuration
    init(configuration: RealmConfiguration) {
        self.configuration = configuration
    }
}

extension SuperhumanTranslator: Translator {
    
    public func translate(model: SuperhumanDatabaseModel) throws -> SuperhumanPlainObject {
        SuperhumanPlainObject(
            name: model.name,
            type: SuperhumanType(rawValue: model.type).unsafelyUnwrapped,
            imageURL: URL(string: model.imageURL).unsafelyUnwrapped,
            backgroundColorHex: model.backgroundColorHex,
            stats: try StatTranslator(configuration: configuration).translate(
                models: Array(model.stats)
            )
        )
    }
    
    public func translate(plain: SuperhumanPlainObject) throws -> SuperhumanDatabaseModel {
        let model = try superhumanStorage.read(byPrimaryKey: plain.uniqueId.rawValue) ?? SuperhumanDatabaseModel()
        try translate(from: plain, to: model)
        return model
    }
    
    public func translate(from plain: SuperhumanPlainObject, to databaseModel: SuperhumanDatabaseModel) throws {
        if databaseModel.uniqueId.isEmpty {
            databaseModel.uniqueId = plain.uniqueId.rawValue
        }
        databaseModel.id = plain.uniqueId.rawValue
        databaseModel.name = plain.name
        databaseModel.type = plain.type.rawValue
        databaseModel.imageURL = plain.imageURL.absoluteString
        databaseModel.backgroundColorHex = plain.backgroundColorHex
        databaseModel.stats.removeAll()
        databaseModel.stats.append(
            objectsIn: try StatTranslator(configuration: configuration).translate(
                plains: plain.stats
            )
        )
    }
}
