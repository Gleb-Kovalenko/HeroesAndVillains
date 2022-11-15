//
//  SuperhumanCellViewModelDesigner.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 02.11.2022.
//

import Foundation

// MARK: - SuperhumanCellViewModelDesigner

public protocol SuperhumanCellViewModelDesigner {

    /// Converts superhuman plaint object to SuperhumanCellViewModelProtocol
    /// - Parameter superhuman: some superhuman
    func viewModel(from superhuman: SuperhumanPlainObject) -> SuperhumanCellViewModelProtocol
}

extension SuperhumanCellViewModelDesigner {

    func viewModels(from superhumans: [SuperhumanPlainObject]) -> [SuperhumanCellViewModelProtocol] {
        superhumans.map{ viewModel(from: $0) }
    }
}
