//
//  HeroesAndVillainsServiceLayerAssembly.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 07.12.2022.
//

import Swinject
import Monreau

// MARK: - HeroesAndVillainsServiceLayerAssembly

final public class HeroesAndVillainsServiceLayerAssembly: CollectableAssembly {
    
    // MARK: - Initializers

    required public init() {
    }

    // MARK: - Assembly

    public func assemble(inContainer container: Container) {
        
        container.register(RealmConfiguration.self) { resolver in
            let configuration = RealmConfiguration(
                databaseFileName: "HeroeasAndVillains.realm",
                databaseVersion: 1,
                migrationBlock: { migration, oldSchemaVersion in
                }
            )
            return configuration
        }.inObjectScope(.container)
        
        container.register(SuperhumanService.self) { resolver in
            let realmConfiguration = resolver.resolve(RealmConfiguration.self).unwrap()
            let superhumanDao = resolver.resolve(SuperhumanDao.self, argument: realmConfiguration).unwrap()
            let service = SuperumanServiceImplementation(superhumanDao: superhumanDao)
            return service
        }
    }
}

