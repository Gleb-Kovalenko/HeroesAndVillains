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
        self.leftAnchor.constraint(equalTo: view.leftAnchor, constant: insets.left).isActive = true
        self.rightAnchor.constraint(equalTo: view.rightAnchor, constant: insets.right).isActive = true
        self.topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top).isActive = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: insets.bottom).isActive = true
    }
}
