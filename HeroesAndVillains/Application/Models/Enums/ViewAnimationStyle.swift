//
//  ViewAnimationStyle.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 29.12.2022.
//

import Foundation
import UIKit

// MARK: - ViewAnimationStyle

enum ViewAnimationStyle {
    
    // MARK: Cases
    
    case slideRightToLeft
    case slideLeftToRight
    case transformSize(scale: Double)
    case setDefaultSize
    
    // MARK: Useful
    
    func animate(_ view: UIView) -> (() -> Void) {
        switch self {
        case .slideLeftToRight:
            return { view.center = CGPoint(x: 3.5 * UIScreen.main.bounds.width / 2, y: view.center.y) }
        case .slideRightToLeft:
            return { view.center = CGPoint(x: -1.5 * UIScreen.main.bounds.width / 2, y: view.center.y) }
        case .transformSize(let scale):
            return { view.transform = CGAffineTransform(scaleX: scale, y: scale) }
        case .setDefaultSize:
            return { view.transform = .identity }
        }
    }
}
