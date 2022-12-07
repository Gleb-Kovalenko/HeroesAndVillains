//
//  HeroesAndVillainsServiceLayerAssembly.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 07.12.2022.
//

import Swinject

// MARK: - HeroesAndVillainsServiceLayerAssembly

final public class HeroesAndVillainsServiceLayerAssembly: CollectableAssembly {
    
    // MARK: - Initializers

    required public init() {
    }

    // MARK: - Assembly

    public func assemble(inContainer container: Container) {
        
        container.register(SuperhumanService.self) { _ in
            SuperumanServiceImplementation()
        }
    }
}

