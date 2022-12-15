//
//  SuperhumanInfoAssembly.swift
//  HeroesAndVillians
//
//  Created by Gleb Kovalenko on 15/12/2022.
//
// swiftlint:disable unused_closure_parameter
// swiftlint:disable closure_parameter_position

import Swinject
import TransitionHandler

// MARK: - SuperhumanInfoModuleAssembly

final public class SuperhumanInfoModuleAssembly: CollectableAssembly {

    // MARK: - Initializers

    required public init() {
    }

    // MARK: - Useful

    public func obtainViewController(withData data: SuperhumanInfoModule.Data) -> SuperhumanInfoViewController {
        container.resolve(SuperhumanInfoViewController.self, argument: data).unwrap()
    }

    // MARK: - Assembly

    public func assemble(inContainer container: Container) {

        container.register(SuperhumanInfoViewController.self) { (resolver, data: SuperhumanInfoModule.Data) in
            let controller = SuperhumanInfoViewController(data: data)
            controller.output = resolver.resolve(SuperhumanInfoViewOutput.self, arguments: controller as SuperhumanInfoViewInput, data)
            return controller
        }

        container.register(SuperhumanInfoRouterInput.self) { (resolver, transitionHandler: TransitionHandler) in
            let router = SuperhumanInfoRouter(transitionHandler: transitionHandler)
            return router
        }

        container.register(SuperhumanInfoViewOutput.self) { (
            resolver,
            view: SuperhumanInfoViewInput,
            data: SuperhumanInfoModule.Data
        ) in
            let transitionHandler = (view as? TransitionHandler).unwrap()
            let router = resolver.resolve(
                SuperhumanInfoRouterInput.self,
                argument: transitionHandler
            ).unwrap()
            let interactor = resolver
                .resolve(SuperhumanInfoInteractorInput.self)
                .unwrap(as: SuperhumanInfoInteractor.self)
            let presenter = SuperhumanInfoPresenter(
                view: view,
                interactor: interactor,
                router: router,
                data: data
            )
            interactor.output = presenter
            return presenter
        }

        container.register(SuperhumanInfoInteractorInput.self) { resolver in
            let superhumanService = resolver.resolve(SuperhumanService.self).unwrap()
            let interactor = SuperhumanInfoInteractor(superhumanService: superhumanService)
            return interactor
        }
    }
}
