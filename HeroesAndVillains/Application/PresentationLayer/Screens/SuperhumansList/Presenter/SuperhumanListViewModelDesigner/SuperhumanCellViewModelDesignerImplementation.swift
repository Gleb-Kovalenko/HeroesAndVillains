//
//  SuperhumanCellViewModelDesignerImplementation.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 02.11.2022.
//

import Foundation

// MARK: - SuperhumanCellViewModelDesignerImplementation

final public class SuperhumanCellViewModelDesignerImplementation {
    
}

// MARK: - SuperhumanCellViewModelDesigner

extension SuperhumanCellViewModelDesignerImplementation: SuperhumanCellViewModelDesigner {

    public func viewModel(from superhuman: SuperhumanPlainObject) -> SuperhumanCellViewModelProtocol {
        SuperhumanCellViewModel(superhuman: superhuman)
    }
}
