//
//  UIButton.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 18.12.2022.
//

import UIKit
import Foundation

// MARK: - UIButton

extension UIButton {
    
    /// Sets the color of the background to use for the specified state.
    ///
    /// In general, if a property is not specified for a state, the default is to use the  value.
    /// If the normal value is not set, then the property defaults to a system value.
    /// Therefore, at a minimum, you should set the value for the normal states
    /// - Parameters:
    ///     - color: The color of the background to use for the specified state
    ///     - cornerRadius: The radius, in points, for the rounded corners on the button. The default value is 8.0.
    ///     - state: The state that uses the specified color.
    func setBackgroundColor(color: UIColor?, cornerRadius: CGFloat = 8.0, for state: UIControl.State) {
        
        guard let color = color else {
            self.setBackgroundImage(nil, for: state)
            return
        }
        let length = 1 + cornerRadius * 2
        let size = CGSize(width: length, height: length)
        let rect = CGRect(origin: .zero, size: size)
        
        var backgroundImage = UIGraphicsImageRenderer(size: size).image { (context) in
            color.setFill()
            UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).fill()
        }
        
        backgroundImage = backgroundImage.resizableImage(withCapInsets: UIEdgeInsets(top: cornerRadius, left: cornerRadius, bottom: cornerRadius, right: cornerRadius))
        
        self.setBackgroundImage(backgroundImage, for: state)
    }
}
