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
    
    public var container: Container
    
    /// Default initializer
    /// - Parameters:
    ///   - container: Container instance
    public init(container: Container) {
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
        return SuperhumanCellPresenter(viewModel: viewModel, service: superhumanService)
    }
}
