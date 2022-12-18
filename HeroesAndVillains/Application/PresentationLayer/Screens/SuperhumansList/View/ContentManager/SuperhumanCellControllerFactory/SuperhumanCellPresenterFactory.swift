//
//  SuperhumanCellPresenterFactory.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 21.10.2022.
//

import Foundation
import UIKit

// MARK: - SuperhumanCellPresenterFactory

public protocol SuperhumanCellPresenterFactory {
    
    /// Create SuperhumanCellPresenter instance using some
    /// viewModel and register it to the given tableView
    ///
    /// - Parameters:
    ///   - viewModel: viewModel instance for cell's configuration
    ///   - tableView: tableView for registering cell
    /// - Returns: SuperhumanCellPresenter instance
    func controller(with viewModel: SuperhumanCellViewModelProtocol, tableView: UITableView) -> SuperhumanCellPresenter
}

// MARK: - Controllers

extension SuperhumanCellPresenterFactory {
    
    /// Create SuperhumanCellPresenter array using some
    /// viewModels and register it to the given tableView
    ///
    /// - Parameters:
    ///   - viewModels: viewModels instances for cells configuration
    ///   - tableView: tableView for registering cells
    /// - Returns: SuperhumanCellPresenter array
    func controllers(with viewModels: [SuperhumanCellViewModelProtocol], tableView: UITableView) -> [SuperhumanCellPresenter] {
        viewModels.map {
            controller(with: $0, tableView: tableView)
        }
    }
}
