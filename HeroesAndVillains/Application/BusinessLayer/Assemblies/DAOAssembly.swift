//
//  DAOAssembly.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 17.12.2022.
//

import Swinject
import Monreau

// MARK: - DAOAssembly

final public class DAOAssembly: CollectableAssembly {
    
    // MARK: - Initializers

    required public init() {
    }

    // MARK: - Assembly

    public func assemble(inContainer container: Container) {
        
        container.register(SuperhumanDao.self) { (resolver, configuration: RealmConfiguration) in
            SuperhumanDao(
                storage: .init(configuration: configuration),
                translator: SuperhumanTranslator(configuration: configuration)
            )
        }
    }
}
