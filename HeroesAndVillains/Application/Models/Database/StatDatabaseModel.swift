//
//  StatDatabaseModel.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 17.12.2022.
//

import Foundation
import RealmSwift
import SDAO

// MARK: - StatDatabaseModel

public final class StatDatabaseModel: RealmModel {
    
    @objc dynamic var longName = ""
    @objc dynamic var shortName = ""
    @objc dynamic var value = 0
}
