//
//  SuperhumanViewInput.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 25.10.2022.
//

import Foundation

// MARK: - SuperhumanViewInput

public protocol SuperhumanViewInput: AnyObject {

    /// Setup initial view state
    func setupInitialState()

    /// Select some superhuman
    /// - Parameter superhumanName: some superhuman's name
    func selectSuperhuman(_ superhumanName: String)
}
