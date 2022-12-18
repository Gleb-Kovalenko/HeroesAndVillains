//
//  SuperhumanListRouter.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 02.11.2022.
//

import Foundation
import TransitionHandler
import VIPER

// MARK: - SuperhumanListRouter

public final class SuperhumanListRouter: Router {
}

// MARK: - SuperhumanListRouterInput

extension SuperhumanListRouter: SuperhumanListRouterInput {
    
    public func close() {
        //Later
    }
    
    public func openDetailInfo(with data: SuperhumanInfoModule.Data) {
        transitionHandler
            .openModule(SuperhumanInfoModule.self, withData: data)
            .to(.navigation(style: .push))
            .then { target in
                target.setModuleOutput(self.transitionHandler.moduleOutput.unwrap())
            }
    }
}
