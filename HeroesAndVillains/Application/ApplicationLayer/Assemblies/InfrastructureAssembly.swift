//
//  InfrastructureAssembly.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 17.12.2022.
//

import Swinject
import Monreau
import RealmSwift

// MARK: - InfrastructureAssembly

public final class InfrastructureAssembly: CollectableAssembly {

    // MARK: - Initializers
    
    required init() {
    }

    public func assemble(inContainer container: Container) {

        container.register(Realm.self) { resolver in
            do {
                /// Returns path for the given file name
                ///
                /// - Parameter fileName: some file name
                /// - Returns: URL if path was created successfully
                func pathForFileName(_ fileName: String) -> URL? {
                    let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first as NSString?
                    guard let realmPath = documentDirectory?.appendingPathComponent(fileName) else {
                        return nil
                    }
                    return URL(string: realmPath)
                }
                let configuration = resolver.resolve(RealmConfiguration.self).unwrap()
                var config = Realm.Configuration.defaultConfiguration
                config.encryptionKey = configuration.encryptionKey
                config.schemaVersion = configuration.databaseVersion
                config.migrationBlock = configuration.migrationBlock
                config.fileURL = pathForFileName(configuration.databaseFileName)
                return try Realm(configuration: config)
            } catch {
                fatalError(error.localizedDescription)
            }
        }
    }
}
