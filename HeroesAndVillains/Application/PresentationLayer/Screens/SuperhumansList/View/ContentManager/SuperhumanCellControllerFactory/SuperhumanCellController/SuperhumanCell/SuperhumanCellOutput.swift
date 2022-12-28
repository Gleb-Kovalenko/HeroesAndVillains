//
//  SuperhumanCellOutput.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 17.12.2022.
//

import Foundation

public protocol SuperhumanCellOutput: AnyObject {
    
    /// Some superhuman was selected as favorite
    func didTriggerFavoriteButtonTappedEvent()
}
