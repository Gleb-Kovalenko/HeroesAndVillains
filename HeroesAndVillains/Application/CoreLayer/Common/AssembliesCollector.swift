//
//  AssembliesCollector.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 18.11.2022.
//

import Swinject


// MARK: - AssembliesCollector

public protocol AssembliesCollector {

    init()

    /// Collect all Application assemblies in container
    ///
    /// - Parameters:
    ///   - container: container for collection
    func collect(inContainer container: Container)
}

extension AssembliesCollector {

    /// Collect all Application assemblies
    public func collect() {
        self.collect(inContainer: AssembliesHolder.container)
    }

    // Collect all Application assemblies
    public static func collect() {
        Self().collect()
    }

    /// Collect all Application assemblies in container
    ///
    /// - Parameters:
    ///   - container: container for collection
    public static func collect(in container: Container) {
        Self().collect(inContainer: container)
    }
}
