//
//  TranslatorsAssemly.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 17.12.2022.
//

import Swinject
import Monreau

// MARK: - TranslatorsAssemly

final public class TranslatorsAssemly: CollectableAssembly {
    
    // MARK: - Initializers

    required public init() {
    }

    // MARK: - Assembly

    public func assemble(inContainer container: Container) {
        
        container.register(StatTranslator.self) { resolver in
            let realmConfiguration = resolver.resolve(RealmConfiguration.self).unwrap()
            let statTranslator = StatTranslator(configuration: realmConfiguration)
            return statTranslator
        }
        
        container.register(SuperhumanTranslator.self) { resolver in
            let realmConfiguration = resolver.resolve(RealmConfiguration.self).unwrap()
            let superhumanTranslator = SuperhumanTranslator(configuration: realmConfiguration)
            return superhumanTranslator
        }
    }
}
