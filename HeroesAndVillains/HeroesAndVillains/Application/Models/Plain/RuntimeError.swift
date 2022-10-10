//
//  RuntimeError.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 04.10.2022.
//

import Foundation

// MARK: - Error

enum RuntimeError: Error {
    case cantOpenJsonFile
    case parseError
    case cantLoadJsonFile
}

// MARK: - LocalizedError

extension RuntimeError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .cantOpenJsonFile:
            return "File can't be open"
        case .parseError:
            return "Parse error"
        case .cantLoadJsonFile:
            return "File can't be loaded"
        }
    }
}
