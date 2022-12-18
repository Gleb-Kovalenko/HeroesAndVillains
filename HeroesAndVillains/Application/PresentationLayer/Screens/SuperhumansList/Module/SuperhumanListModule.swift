//
//  SuperhumanListModule.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 18.11.2022.
//

import Foundation
import TransitionHandler


// MARK: - SuperhumanListModule

public final class SuperhumanListModule: AdvancedModule {
    
    // MARK: - Aliases
    
    public typealias View = SuperhumansListViewController
    public typealias Input = SuperhumanListModuleInput
    public typealias Data = SuperhumanType
    
    
    // MARK: - Module
    
    public static func instantiate(withData data: SuperhumanType) -> View {
        SuperhumanListAssembly().obtainViewController(with: data)
    }
}
