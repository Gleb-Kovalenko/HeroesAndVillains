//
//  SuperhumanListModule.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 18.11.2022.
//

import Foundation


// MARK: - SuperhumanListModule

final class SuperhumanListModule {

    // MARK: - Module

    public static func instantiate() -> SuperhumansListViewController {
        SuperhumanListAssembly().obtainViewController()
    }
}
