//
//  SuperhumanListAssembly.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 18.11.2022.
//

import Foundation
import Swinject
import TransitionHandler

// MARK: - SuperhumanListAssembly

final public class SuperhumanListAssembly: CollectableAssembly {
    
    // MARK: - Initializers

    required public init() {
    }

    // MARK: - Useful

    public func obtainViewController() -> SuperhumansListViewController {
        container.resolve(SuperhumansListViewController.self).unwrap()
    }

    // MARK: - Assembly

    public func assemble(inContainer container: Container) {
        
        container.register(SuperhumansListViewController.self) { resolver in
            let controller = SuperhumansListViewController()
            controller.output = resolver.resolve(SuperhumanViewOutput.self, argument: controller as SuperhumanViewInput)
            controller.contentManager = resolver.resolve(SuperhumanContentManager.self, argument: controller as TransitionHandler)
            return controller
        }
        
        container.register(SuperhumanListRouterInput.self) { (resolver, transitionHandler: TransitionHandler) in
            SuperhumanListRouter(transitionHandler: transitionHandler)
        }
        
        container.register(SuperhumanViewOutput.self) { (resolver, view: SuperhumanViewInput) in
            let interactor = resolver
                .resolve(SuperhumanListInteractorInput.self)
                .unwrap(as: SuperhumanListInteractor.self)
            let superhumanCellViewModelDesigner = resolver.resolve(SuperhumanCellViewModelDesigner.self).unwrap()
            let presenter = SuperhumanListPresenter(
                view: view,
                interactor: interactor,
                superhumanCellViewModelDesigner: superhumanCellViewModelDesigner
            )
            interactor.output = presenter
            return presenter
        }
        
        container.register(SuperhumanService.self) { _ in
            SuperumanServiceImplementation()
        }
        
        container.register(SuperhumanListInteractorInput.self) { resolver in
            let superhumanService = resolver.resolve(SuperhumanService.self).unwrap()
            let interactor = SuperhumanListInteractor(superhumanService: superhumanService)
            return interactor
        }
        
        container.register(SuperhumanCellPresenterFactory.self) { resolver in
            SuperhumanCellPresenterFactoryImplementation()
        }

        container.register(SuperhumanCellViewModelDesigner.self) { _ in
            SuperhumanCellViewModelDesignerImplementation()
        }

        container.register(SuperhumanContentManager.self) { (resolver, transitionHandler: TransitionHandler) in
            let presentersFactory = resolver.resolve(SuperhumanCellPresenterFactory.self).unwrap()
            let contentManager = SuperhumanContentManagerImplementation(
                presentersFactory: presentersFactory
            )
            return contentManager
        }
    }
}
