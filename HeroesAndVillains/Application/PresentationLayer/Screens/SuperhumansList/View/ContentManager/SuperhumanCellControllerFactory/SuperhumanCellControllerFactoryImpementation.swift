//
//  SuperhumanCellControllerFactoryImpementation.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 21.10.2022.
//

import Foundation
import UIKit

// MARK: - SuperhumanCellControllerFactoryImplementation

final public class SuperhumanCellControllerFactoryImplementation {
    
}

// MARK: - SuperhumanCellControllerFactory

extension SuperhumanCellControllerFactoryImplementation: SuperhumanCellControllerFactory {
    
    public func controller(
        with viewModel: SuperhumanCellViewModelProtocol,
        tableView: UITableView
    ) -> SuperhumanCellController {
        SuperhumanCellController.registerCell(on: tableView)
        return SuperhumanCellController(viewModel: viewModel)
    }
}
