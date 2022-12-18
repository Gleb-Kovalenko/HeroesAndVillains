//
//  SuperhumanCellPresenterFactoryImpementation.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 21.10.2022.
//

import Foundation
import UIKit

// MARK: - SuperhumanCellPresenterFactoryImplementation

final public class SuperhumanCellPresenterFactoryImplementation {
}

// MARK: - SuperhumanCellPresenterFactory

extension SuperhumanCellPresenterFactoryImplementation: SuperhumanCellPresenterFactory {
    
    public func controller(
        with viewModel: SuperhumanCellViewModelProtocol,
        tableView: UITableView
    ) -> SuperhumanCellPresenter {
        SuperhumanCellPresenter.registerCell(on: tableView)
        return SuperhumanCellPresenter(viewModel: viewModel)
    }
}
