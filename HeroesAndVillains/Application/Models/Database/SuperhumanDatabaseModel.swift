//
//  SuperhumanDatabaseModel.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 17.12.2022.
//

import Foundation
import RealmSwift
import SDAO

// MARK: - SuperhumanDatabaseModel

public final class SuperhumanDatabaseModel: RealmModel {
    
    @objc dynamic var id = ""
    @objc dynamic var name = ""
    @objc dynamic var type = 0
    @objc dynamic var imageURL = ""
    @objc dynamic var isFavotire = false
    @objc dynamic var backgroundColorHex = ""
    let stats = List<StatDatabaseModel>()
}
