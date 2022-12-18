//
//  SuperhumanListRouterInput.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 02.11.2022.
//

import Foundation

public protocol SuperhumanListRouterInput {
    
    /// Close current module
    func close()
    
    /// Open selected superhuman detailed info
    func openDetailInfo(with data: SuperhumanInfoModule.Data)
}
