//
//  AssembliesHolder.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 18.11.2022.
//

import Foundation
import Swinject

// MARK: - AssembliesHolder

public final class AssembliesHolder {

    // MARK: - Properties

    /// Singleton container
    public static var container: Container {
        AssembliesHolder.instance.container
    }

    /// Private singleton instance
    private static let instance = AssembliesHolder()

    /// Global DI container
    private let container: Container

    // MARK: - Initializers

    /// Default initializer
    private init() {
        container = Container()
    }
}

// MARK: - CollectableAssembly

protocol CollectableAssembly {

    init()

    /// Method for registering your assemblies
    ///
    /// - Parameter container: Container for dependency ijection
    func assemble(inContainer container: Container)
}

extension CollectableAssembly {

    /// Container with all dependencies
    var container: Container {
        AssembliesHolder.container
    }

    /// Wrapper for protocol's assemble method
    func assemble() {
        assemble(inContainer: container)
    }
}
