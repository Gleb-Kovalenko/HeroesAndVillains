//
//  SuperhumanInfoModuleOutput.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 15/12/2022.
//

import TransitionHandler

// MARK: - SuperhumanInfoModuleOutput

public protocol SuperhumanInfoModuleOutput: ModuleOutput {
    
    /// Update cell
    /// - Parameters:
    ///   - plain: updated plain, that must be replaced in cell instead of old plain
    func updateCellInfo(with plain: SuperhumanPlainObject)
}
