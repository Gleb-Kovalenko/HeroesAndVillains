//
//  SuperhumanInfoPresenter.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 15/12/2022.
//

import VIPER

// MARK: - SuperhumanInfoPresenter

final public class SuperhumanInfoPresenter {

    // MARK: - Properties

    /// ModuleOutput instance
    weak var output: SuperhumanInfoModuleOutput?

    /// View instance
    private unowned let view: SuperhumanInfoViewInput

    /// Interactor instance
    private let interactor: SuperhumanInfoInteractorInput

    /// Router instance
    private let router: SuperhumanInfoRouterInput
    
    /// Selected superhuman's data
    private let data: SuperhumanInfoModule.Data

    // MARK: - Initializers

    /// Default initializer
    /// - Parameters:
    ///   - view: SuperhumanInfoViewInput instance
    ///   - interactor: SuperhumanInfoInteractorInput instance
    ///   - router: SuperhumanInfoRouterInput instance
    ///   - data: Selected superhuman's data
    public init(
        view: SuperhumanInfoViewInput,
        interactor: SuperhumanInfoInteractorInput,
        router: SuperhumanInfoRouterInput,
        data: SuperhumanInfoModule.Data
    ) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.data = data
    }
}

// MARK: - SuperhumanInfoViewOutput

extension SuperhumanInfoPresenter: SuperhumanInfoViewOutput {

    public func didTriggerViewReadyEvent() {
        view.setupInitialState()
    }
}

// MARK: - SuperhumanInfoInteractorOutput

extension SuperhumanInfoPresenter: SuperhumanInfoInteractorOutput {

    public func processErrorMessage(_ errorMessage: String) {
    }
}
