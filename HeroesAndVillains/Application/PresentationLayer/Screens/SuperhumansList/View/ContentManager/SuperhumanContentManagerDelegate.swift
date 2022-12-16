//
//  SuperhumanContentManagerDelegate.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 16.12.2022.
//

import Foundation


// MARK: - SuperhumanContentManagerDelegate

public protocol SuperhumanContentManagerDelegate: AnyObject {

    /// Some superhuman was selected
    /// - Parameter superhuman: selected superhuman
    func didSelectSuperhuman(_ superhuman: SuperhumanPlainObject)
}
