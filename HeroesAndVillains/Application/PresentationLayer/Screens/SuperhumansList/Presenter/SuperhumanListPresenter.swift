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
    private unowned let view: SuperhumanViewInput

    /// SuperhumanCellViewModelProtocol factory
    private let superhumanCellViewModelDesigner: SuperhumanCellViewModelDesigner

    /// Interactor instance
    private let interactor: SuperhumanListInteractorInput?
    
    /// Content manager instance
    private let contentManager: SuperhumanContentManager?

    /// Router instance
    var router: SuperhumanListRouterInput?

    // MARK: - Initializers

    /// Default initializer
    /// - Parameters:
    ///   - view: SuperhumanViewInput instance
    ///   - interactor: SuperhumanListInteractorInput instance
    init(
        view: SuperhumanViewInput,
        interactor: SuperhumanListInteractorInput,
        contentManager: SuperhumanContentManager,
        superhumanCellViewModelDesigner: SuperhumanCellViewModelDesigner
    ) {
        self.view = view
        self.interactor = interactor
        self.contentManager = contentManager
        self.superhumanCellViewModelDesigner = superhumanCellViewModelDesigner
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
        contentManager?.updateData(viewModels)
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
