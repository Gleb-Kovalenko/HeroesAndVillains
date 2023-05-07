//
//  Array+UIView.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 29.12.2022.
//

import Foundation
import UIKit

// MARK: - Array+UIView

extension Array where Element: UIView {
    
    func startAnimation(
        duration: Double = 0.4,
        delay: Double = 0.3,
        animation: ViewAnimationStyle,
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
