//
//  SuperhumansTabBar.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 22.01.2023.
//

import Foundation
import UIKit

// MARK: - SuperhumansTabBar

public final class SuperhumansTabBar: UITabBarController {
    
    /// Superhumans list controllers
    private var controllers = [UIViewController]()
    
    // MARK: - TabBarController
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        design()
        setSuperhumansControllers()
    }
    
    // MARK: - Private
    
    private func setSuperhumansControllers() {
        
        controllers.removeAll()
        for superhumanType in SuperhumanType.allCases {
            let superhumanTypeListController = UINavigationController(
                rootViewController: SuperhumanListModule.instantiate(withData: superhumanType)
            )
            superhumanTypeListController.tabBarItem = UITabBarItem(
                title: superhumanType.title,
                image: UIImage(named: superhumanType.tabImageName),
                selectedImage: nil
            )
            controllers.append(superhumanTypeListController)
        }
        viewControllers = controllers
    }
}

// MARK: - Layout

extension SuperhumansTabBar {
    
    private func setupLayout() {
        tabBar.isTranslucent = false
    }
}

// MARK: - Design

extension SuperhumansTabBar {
    
    func design() {
        tabBar.barTintColor = .black
        tabBar.tintColor = .white
    }
}

