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
            let superhumanDAO = resolver.resolve(SuperhumanDAO.self).unwrap()
            let service = SuperumanServiceImplementation(superhumanDAO: superhumanDAO)
            return service
        }
    }
}

