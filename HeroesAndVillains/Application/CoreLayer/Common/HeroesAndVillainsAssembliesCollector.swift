//
//  HeroesAndVillainsAssembliesCollector.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 18.11.2022.
//

import Foundation
import Swinject

// MARK: - HeroesAndVillainsAssembliesCollector

final class HeroesAndVillainsAssembliesCollector: AssembliesCollector {
    
    func collect(inContainer container: Container) {
        
        let typeCount = Int(objc_getClassList(nil, 0))
        let types = UnsafeMutablePointer<AnyClass?>.allocate(capacity: typeCount)
        let autoreleasingTypes = AutoreleasingUnsafeMutablePointer<AnyClass>(types)
        
        objc_getClassList(autoreleasingTypes, Int32(typeCount))
        
        let priorityAssemblies: [CollectableAssembly.Type] = [
            SuperhumanListAssembly.self
        ]
        
        priorityAssemblies.forEach {
            $0.init().assemble(inContainer: container)
        }
        
        for index in 0..<typeCount {
            if let assemblyType = (types[index] as? CollectableAssembly.Type) {
                let object = assemblyType.init()
                object.assemble(inContainer: container)
            }
        }
        
        types.deallocate()
    }
}
