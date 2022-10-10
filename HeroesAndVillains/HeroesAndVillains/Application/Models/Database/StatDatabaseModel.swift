//
//  StatDatabaseModel.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 06.10.2022.
//

import Foundation
import RealmSwift
import SDAO

// MARK: - StatDatabaseModel

final class StatDatabaseModel: RealmModel {
    
    @objc dynamic var longName = ""
    @objc dynamic var shortName = ""
    @objc dynamic var value = 0
}
