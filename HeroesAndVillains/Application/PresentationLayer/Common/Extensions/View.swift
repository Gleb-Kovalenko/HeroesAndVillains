//
//  View.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 23.09.2022.
//

import Foundation
import UIKit

// MARK: - UIView

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
    
    func setGradient(startColor: UIColor, endColor: UIColor = UIColor(.black)) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.locations = [0, 1]
        gradientLayer.startPoint = CGPoint(x: 0.25, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.75, y: 0.5)
        gradientLayer.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 1, c: -1, d: 0, tx: 1, ty: 0))
        gradientLayer.position = self.center
        gradientLayer.frame = self.bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func startAnimation(
        duration: Double = 0.4,
        delay: Double = 0.0,
        animation: CellAnimationStyle,
        completionBlock: (() -> Void)? = nil
    ){
        
        UIView.animate(withDuration: duration,
            delay: delay,
            usingSpringWithDamping: 1,
            initialSpringVelocity: 0.05,
            options: UIView.AnimationOptions.curveEaseInOut,
            animations: animation.animate(self),
            completion: { _ in
            if let block = completionBlock {
                block()
            }
        })
    }
}
