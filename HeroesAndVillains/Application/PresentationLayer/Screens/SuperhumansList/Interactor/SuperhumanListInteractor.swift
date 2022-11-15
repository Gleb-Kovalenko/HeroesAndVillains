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
    var output: SuperhumanListInteractorOutput
    
    /// Superhuman service instance
    private let superhumanService: SuperhumanService
    
    // MARK: - Initializers
    
    /// Default initializer
    ///
    /// - Parameters:
    ///    - superhumanService: service instance
    ///    - superhumanPresenter: presenter instance
    init(superhumanService: SuperhumanService, superhumanPresenter: SuperhumanListInteractorOutput) {
        self.superhumanService = superhumanService
        self.output = superhumanPresenter
    }
}

// MARK: - SuperhumanListInteractorInput

extension SuperhumanListInteractor: SuperhumanListInteractorInput {
    
    public func obtainSuperhumans() {
        superhumanService
            .obtain()
            .async()
            .success(output.obtainSuperhumanSuccess)
            .failure(output.processError)
    }
}
