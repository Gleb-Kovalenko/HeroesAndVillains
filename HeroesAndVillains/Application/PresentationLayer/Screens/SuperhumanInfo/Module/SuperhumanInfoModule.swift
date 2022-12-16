//
//  SuperhumanInfoModule.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 15/12/2022.
//

import UIKit
import TransitionHandler

// MARK: - SuperhumanInfoModule

final public class SuperhumanInfoModule: AdvancedModule {

    // MARK: - Aliases

    public typealias Input = SuperhumanInfoModuleInput
    public typealias View = SuperhumanInfoViewController
    public typealias Data = SuperhumanPlainObject

    // MARK: - Initializers

    required public init() {
    }

    // MARK: - Module

    public static func instantiate(withData data: Data) -> SuperhumanInfoViewController {
        SuperhumanInfoModuleAssembly().obtainViewController(withData: data)
    }
}
