//
//  SuperhumanCellPresenterFactoryImpementation.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 21.10.2022.
//

import Foundation
import UIKit
import Swinject

// MARK: - SuperhumanCellPresenterFactoryImplementation

final public class SuperhumanCellPresenterFactoryImplementation {
    
    /// DI container
    public var container: Container
    
    /// SuperhumanListViewController instance
    public unowned var view: SuperhumanViewInput
    
    /// Default initializer
    /// - Parameters:
    ///   - container: Container instance
    ///   - view: SuperhumanListViewController instance
    public init(container: Container, view: SuperhumanViewInput) {
        self.view = view
        self.container = container
    }
}

// MARK: - SuperhumanCellPresenterFactory

extension SuperhumanCellPresenterFactoryImplementation: SuperhumanCellPresenterFactory {
    
    public func controller(
        with viewModel: SuperhumanCellViewModelProtocol,
        tableView: UITableView
    ) -> SuperhumanCellPresenter {
        SuperhumanCellPresenter.registerCell(on: tableView)
        let superhumanService = container.resolve(SuperhumanService.self).unwrap()
        return SuperhumanCellPresenter(viewModel: viewModel, superhumanService: superhumanService, view: view)
    }
}
