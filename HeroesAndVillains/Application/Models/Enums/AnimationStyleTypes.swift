//
//  AnimationStyleTypes.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 29.12.2022.
//

import Foundation
import UIKit

enum AnimationStyleTypes {
    
    case slideRightToLeft
    case slideLeftToRight
    case transformSize(scale: Double)
    case setDefaultSize
    
    func animate(_ view: UIView) -> (() -> Void) {
        switch self {
        case .slideLeftToRight:
            return { view.center = CGPoint(x: 3.5 * view.center.x, y: view.center.y) }
        case .slideRightToLeft:
            return { view.center = CGPoint(x: -1.5 * view.center.x, y: view.center.y) }
        case .transformSize(let scale):
            return { view.transform = CGAffineTransform(scaleX: scale, y: scale) }
        case .setDefaultSize:
            return { view.transform = CGAffineTransform.identity }
        }
    }
}
