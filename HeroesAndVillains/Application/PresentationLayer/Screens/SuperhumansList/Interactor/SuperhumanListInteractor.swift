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
    
    private let data: SuperhumanListModule.Data
    
    // MARK: - Initializers
    
    /// Default initializer
    ///
    /// - Parameters:
    ///    - superhumanService: service instance
    public init(superhumanService: SuperhumanService, data: SuperhumanListModule.Data) {
        self.superhumanService = superhumanService
        self.data = data
    }
}

// MARK: - SuperhumanListInteractorInput

extension SuperhumanListInteractor: SuperhumanListInteractorInput {
    
    public func obtainSuperhumans() {
        superhumanService
            .obtain(with: data)
            .async()
            .success(output?.obtainSuperhumanSuccess)
            .failure(output?.processError)
    }
}
