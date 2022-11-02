//
//  SuperhumanViewOutput.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 25.10.2022.
//

import Foundation

// MARK: - SuperhumanViewOutput

public protocol SuperhumanViewOutput {

    /// View is ready
    func didTriggerViewReadyEvent()

    /// Some superhuman was selected
    /// - Parameter superhumanName: some superhuman
    func didTriggerSelectSuperhumanEvent(_ superhuman: SuperhumanPlainObject)
}
