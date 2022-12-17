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
        
        container.register(SuperhumanDAO.self) { resolver in
            let configuration = resolver.resolve(RealmConfiguration.self).unwrap()
            let superhumanTranslator = resolver.resolve(SuperhumanTranslator.self).unwrap()
            let superhumanDAO = SuperhumanDAO(
                storage: .init(configuration: configuration),
                translator: superhumanTranslator
            )
            return superhumanDAO
        }
    }
}
