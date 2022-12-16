//
//  SuperhumanContentManager.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 21.10.2022.
//

import Foundation
import VIPER
import SDAO

// MARK: - SuperhumanContentManager

public protocol SuperhumanContentManager: GeneralContentManager {

    /// Delegate instance
    var delegate: SuperhumanContentManagerDelegate? { get set }
    
    /// Update table's data using some new viewModels
    ///
    /// - Parameter viewModels: new data
    func updateData(_ viewModels: [SuperhumanCellViewModelProtocol])

    /// Select some superhuman
    /// - Parameter superhumanName: some superhuman's name
    func selectSuperhuman(_ superhumanId: UniqueID)
}
