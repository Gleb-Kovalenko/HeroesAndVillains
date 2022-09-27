//
//  View.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 23.09.2022.
//

import Foundation
import UIKit

extension UIView {
    
    func fullPinTo(view: UIView, with insets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)) {
        leftAnchor.constraint(equalTo: view.leftAnchor, constant: insets.left).isActive = true
        rightAnchor.constraint(equalTo: view.rightAnchor, constant: insets.right).isActive = true
        topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: insets.bottom).isActive = true
    }
    
    func smoothCorners(
        _ corners: UIRectCorner = .allCorners,
        radius: CGFloat,
        inRect rect: CGRect? = nil
    ) {
        let roundedRect = rect ?? bounds
        guard roundedRect.size != .zero else {
            return
        }
        let roundPath = UIBezierPath(
            roundedRect: roundedRect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        let maskLayer = CAShapeLayer()
        maskLayer.path = roundPath.cgPath
        layer.mask = maskLayer
    }
}
