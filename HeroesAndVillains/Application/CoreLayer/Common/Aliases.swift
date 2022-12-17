//
//  Aliases.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 17.12.2022.
//

import Foundation
import SDAO
import Monreau

// MARK: - Aliaes

typealias StatDAO = DAO<RealmStorage<StatDatabaseModel>, StatTranslator>
typealias SuperhumanDAO = DAO<RealmStorage<SuperhumanDatabaseModel>, SuperhumanTranslator>
