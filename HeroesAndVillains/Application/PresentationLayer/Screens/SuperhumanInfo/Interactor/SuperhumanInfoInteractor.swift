//
//  SuperhumanInfoInteractor.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 15/12/2022.
//

import VIPER
import SDAO

// MARK: - SuperhumanInfoInteractor

final public class SuperhumanInfoInteractor {

    // MARK: - Properties

    /// Presenter instance
    weak var output: SuperhumanInfoInteractorOutput?
    
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

// MARK: - SuperhumanInfoInteractorInput

extension SuperhumanInfoInteractor: SuperhumanInfoInteractorInput {
    
    /// Toggle favorite state in superhuman by id
    public func toggleFavorite(superhumanId: UniqueID) {
        superhumanService
            .toggleFavorite(superhumanID: superhumanId)
            .async()
            .success(output?.favoriteToggleSuccess)
            .failure(output?.processError)
    }
}
