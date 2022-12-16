//
//  SuperhumanListInteractor.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 02.11.2022.
//

import Foundation

// MARK: - SuperhumanListInteractor

public final class SuperhumanListInteractor {
    
    // MARK: - Properties
    
    /// Presenter instance
    weak var output: SuperhumanListInteractorOutput?
    
    /// Superhuman service instance
    private let superhumanService: SuperhumanService
    
    // MARK: - Initializers
    
    /// Default initializer
    ///
    /// - Parameters:
    ///    - superhumanService: service instance
    public init(superhumanService: SuperhumanService) {
        self.superhumanService = superhumanService
    }
}

// MARK: - SuperhumanListInteractorInput

extension SuperhumanListInteractor: SuperhumanListInteractorInput {
    
    public func obtainSuperhumans() {
        superhumanService
            .obtain()
            .async()
            .success(output?.obtainSuperhumanSuccess)
            .failure(output?.processError)
    }
}
