//
//  SuperhumanViewOutput.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 25.10.2022.
//

import Foundation
import TransitionHandler

// MARK: - SuperhumanViewOutput

public protocol SuperhumanViewOutput {
    
    /// View is ready
    func didTriggerViewReadyEvent()
}
