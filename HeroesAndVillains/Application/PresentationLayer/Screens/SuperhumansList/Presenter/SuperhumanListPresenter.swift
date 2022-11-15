//
//  SuperhumanListPresenter.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 02.11.2022.
//

import Foundation
import TransitionHandler

// MARK: - SuperhumanListPresenter

public final class SuperhumanListPresenter {
    
    // MARK: - Properties

    /// SuperhumanListModuleOutput instance
    weak var output: SuperhumanListModuleOutput?

    /// View instance
    var view: SuperhumanViewInput

    /// SuperhumanCellViewModelProtocol factory
    private let superhumanCellViewModelDesigner: SuperhumanCellViewModelDesigner

    /// Interactor instance
    var interactor: SuperhumanListInteractorInput?

    /// Router instance
    var router: SuperhumanListRouterInput?

    // MARK: - Initializers

    /// Default initializer
    ///
    /// - Parameter superhumanCellViewModelDesigner: SuperhumanCellViewModelProtocol factory
    public init(
        superhumanCellViewModelDesigner: SuperhumanCellViewModelDesigner,
        superhumanViewInput: SuperhumanViewInput
    ) {
        self.superhumanCellViewModelDesigner = superhumanCellViewModelDesigner
        self.view = superhumanViewInput
        interactor = SuperhumanListInteractor(
            superhumanService: SuperumanServiceImplementation(),
            superhumanPresenter: self
        )
    }
}

// MARK: - SuperhumanListOutput

extension SuperhumanListPresenter: SuperhumanViewOutput {
    
    public func didTriggerSelectSuperhumanEvent(_ superhuman: SuperhumanPlainObject) {
        //Here something with router
    }
    
    public func didTriggerViewReadyEvent() {
        view.setupInitialState()
        interactor?.obtainSuperhumans()
    }
}

// MARK: - SuperhumanListInteractorOutput

extension SuperhumanListPresenter: SuperhumanListInteractorOutput {
    
    public func obtainSuperhumanSuccess(_ superhumans: [SuperhumanPlainObject]) {
        let viewModels = superhumanCellViewModelDesigner.viewModels(from: superhumans)
        view.update(viewModels)
    }
    
    public func processErrorMessage(_ errorMessage: String) {
    }
}

// MARK: - SuperhumanListModuleInput

extension SuperhumanListPresenter: SuperhumanListModuleInput {

    public func setModuleOutput(_ moduleOutput: ModuleOutput) {
        self.output = moduleOutput as? SuperhumanListModuleOutput
    }
}
