//
//  SuperumanServiceImplementation.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 02.11.2022.
//

import Foundation
import ServiceCore

// MARK: - SuperumanServiceImplementation

public final class SuperumanServiceImplementation: Service {
}

// MARK: - SuperhumanService

extension SuperumanServiceImplementation: SuperhumanService {
    
    public func obtain(with filter: SuperhumanType) -> ServiceCall<[SuperhumanPlainObject]> {
        createCall {
            guard let fileUrl = Bundle.main.url(forResource: "SuperhumansInfo", withExtension: "json") else {
                return .success([])
            }
            let data = try Data(contentsOf: fileUrl)
            let plains = try data.jsonDecoded() as [SuperhumanPlainObject]
            return .success(plains.filter{ $0.type == filter })
        }
    }
}
