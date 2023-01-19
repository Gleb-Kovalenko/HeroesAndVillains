//
//  Optional+UIView.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 09.01.2023.
//

import Foundation
import UIKit

// MARK: - Optional+UIView

extension Optional where Wrapped == UIView {
  
    func startAnimation(
        duration: Double = 0.4,
        delay: Double = 0.0,
        animation: ViewAnimationStyle,
        completionBlock: (() -> Void)? = nil
    ){
        if let view = self {
            view.startAnimation(
                duration: duration,
                delay: delay,
                animation: animation,
                completionBlock: completionBlock
            )
        }
    }
}
