//
//  Array+NSObject.swift
//  HeroesAndVillains
//
//  Created by Глеб Коваленко on 09.01.2023.
//

import Foundation

// MARK: - Array+NSObject

extension Array where Element: NSObject {

    /// Returns an array containing the elements from the original array
    /// that are equal in the second array
    /// and the unique elements from the second array
    ///
    /// Example:
    ///
    /// Let objects be equal when they have the same id
    ///
    ///     class SomeObject: NSObject {
    ///         var id: Int
    ///         var someOtherProperty: String
    ///
    ///         init(id: Int, someOtherProperty: String) {
    ///             self.id = id
    ///             self.someOtherProperty = someOtherProperty
    ///         }
    ///     }
    ///
    ///     extension SomeObject {
    ///
    ///        override func isEqual(_ object: Any?) -> Bool {
    ///            guard let object = object as? SomeObject else {
    ///                return false
    ///            }
    ///            return id == object.id
    ///        }
    ///     }
    ///
    /// Than we have two arrays:
    ///
    ///     let firstArray = [
    ///         SomeObject(id: 1, someOtherProperty: "hello"),
    ///         SomeObject(id: 2, someOtherProperty: "swift")
    ///     ]
    ///
    ///     let secondArray = [
    ///         SomeObject(id: 1, someOtherProperty: "world"),
    ///         SomeObject(id: 3, someOtherProperty: "uikit")
    ///     ]
    ///
    /// And result of function:
    ///
    ///     let resultArray = firstArray.duplicatesAndUnique(from: secondArray)
    ///
    /// And `resultArray` has the following value:
    ///
    ///     resultArray = [
    ///
    ///         //Element from `firstArray` that equals to element in `secondArray`
    ///         SomeObject(id: 1, someOtherProperty: "hello"),
    ///
    ///         // Unique element from `secondArray`
    ///         SomeObject(id: 3, someOtherProperty: "uikit")
    ///     ]
    ///
    /// - Parameter array: array to compare with the original one
    /// - Returns: array with equals elements from original and second arrays and with unique elements from second one
    func duplicatesAndUnique(from array: [Element]) -> [Element] {
    
        var newArray = array
        self.forEach { element in
            let index = array.firstIndex(where: { $0.isEqual(element) })
            if let index = index {
                newArray[index] = element
            }
        }
        return newArray
    }
}
