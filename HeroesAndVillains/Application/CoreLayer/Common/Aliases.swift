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

typealias StatDao = DAO<RealmStorage<StatDatabaseModel>, StatTranslator>
typealias SuperhumanDao = DAO<RealmStorage<SuperhumanDatabaseModel>, SuperhumanTranslator>
