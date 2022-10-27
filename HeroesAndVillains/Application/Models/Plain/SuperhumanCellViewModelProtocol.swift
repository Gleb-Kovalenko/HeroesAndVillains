//
//  SuperhumanCellViewModelProtocol.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 05.10.2022.
//

import Foundation

// MARK: - SuperhumanCellViewModelProtocol

public protocol SuperhumanCellViewModelProtocol {
    var name: String { get }
    var isFavorite: Bool { get set }
    var stats: [StatPlainObject] { get }
    var imageUrl: URL { get }
    var backgroundColorHex: String { get }
}
