//
//  SuperhumanListAssembly.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 18.11.2022.
//

import Foundation
import Swinject
import TransitionHandler
import UIKit

// MARK: - SuperhumanListAssembly

final public class SuperhumanListAssembly: CollectableAssembly {
    
    // MARK: - Initializers

    required public init() {
    }

    // MARK: - Useful

    public func obtainViewController(with data: SuperhumanListModule.Data) -> SuperhumansListViewController {
        container.resolve(SuperhumansListViewController.self, argument: data).unwrap()
    }

    // MARK: - Assembly

    public func assemble(inContainer container: Container) {
        
        container.register(SuperhumansListViewController.self) { (
            resolver,
            data: SuperhumanListModule.Data
        ) in
            let controller = SuperhumansListViewController(data: data)
            controller.output = resolver.resolve(SuperhumanViewOutput.self, arguments: controller, data)
            return controller
        }
        
        container.register(SuperhumanListRouterInput.self) { (resolver, transitionHandler: TransitionHandler) in
            SuperhumanListRouter(transitionHandler: transitionHandler)
        }
        
        container.register(SuperhumanViewOutput.self) { (
            resolver,
            view: SuperhumansListViewController,
            data: SuperhumanListModule.Data
        ) in
            let interactor = resolver
                .resolve(SuperhumanListInteractorInput.self, argument: data)
                .unwrap(as: SuperhumanListInteractor.self)
            let superhumanCellViewModelDesigner = resolver.resolve(SuperhumanCellViewModelDesigner.self).unwrap()
            var contentManager = resolver.resolve(SuperhumanContentManager.self, arguments: view, data).unwrap()
            let transitionHandler = view as TransitionHandler
            let presenter = SuperhumanListPresenter(
                view: view as SuperhumanViewInput,
                interactor: interactor,
                contentManager: contentManager,
                superhumanCellViewModelDesigner: superhumanCellViewModelDesigner
            )
            presenter.router = resolver.resolve(SuperhumanListRouterInput.self, argument: transitionHandler)
            contentManager.delegate = presenter as SuperhumanContentManagerDelegate
            interactor.output = presenter
            return presenter
        }
        
        container.register(SuperhumanListInteractorInput.self) { (
            resolver,
            data: SuperhumanListModule.Data
        ) in
            let superhumanService = resolver.resolve(SuperhumanService.self).unwrap()
            return SuperhumanListInteractor(superhumanService: superhumanService, data: data)
        }
        
        container.register(SuperhumanCellPresenterFactory.self) { (resolver, view: SuperhumanViewInput) in
            let container = resolver.resolve(Container.self).unwrap()
            return SuperhumanCellPresenterFactoryImplementation(container: container, view: view)
        }

        container.register(SuperhumanCellViewModelDesigner.self) { _ in
            SuperhumanCellViewModelDesignerImplementation()
        }

        container.register(SuperhumanContentManager.self) { (resolver, controller: SuperhumansListViewController, data: SuperhumanListModule.Data) in
            let presentersFactory = resolver.resolve(SuperhumanCellPresenterFactory.self, argument: controller as SuperhumanViewInput).unwrap()
            let contentManager = SuperhumanContentManagerImplementation(presentersFactory: presentersFactory)
            contentManager.configure(withContentView: controller.tableView)
            return contentManager
        }
    }
}
