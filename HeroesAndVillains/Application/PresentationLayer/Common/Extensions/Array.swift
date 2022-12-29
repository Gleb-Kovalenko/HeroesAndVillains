//
//  Array.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 29.12.2022.
//

import Foundation
import UIKit

extension Array where Element: UIView {
    
    func startAnimations(
        duration: Double = 0.4,
        delay: Double = 0.3,
        animation: CellAnimationStyle,
        completionBlock: (() -> Void)? = nil,
        then afterCompleteBlock: (() -> Void)? = nil
    ) {
        
        if self.isEmpty {
            afterCompleteBlock?()
            return
        }
        
        for (index, view) in self.enumerated() {
            if index == self.count - 1 {
                view.startAnimation(
                    duration: duration,
                    delay: delay * Double(self.count - index - 1),
                    animation: animation,
                    completionBlock: {
                        completionBlock?()
                        afterCompleteBlock?()
                    }
                )
            } else {
                view.startAnimation(
                    duration: duration,
                    delay: delay * Double(self.count - index - 1),
                    animation: animation,
                    completionBlock: {
                        completionBlock?()
                    }
                )
            }
        }
    }
}
