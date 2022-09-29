//
//  StatView.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 29.09.2022.
//

import Foundation
import UIKit

// MARK: - StatView

final public class StatView: UIView {
    
    // MARK: - Propeties
    
    /// Label with superhuman's stat value
    private let statValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .right
        return label
    }()
    
    /// Label with superhuman's stat name
    private let statNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.38)
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    // MARK: - StatView
    
    init() {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Useful
    
    public func setupText(statValue: Int, statName: String) {
        statValueLabel.text = String(statValue)
        statNameLabel.text = statName
    }
    
    private func setupLayout() {
        setupStatValueLabel()
        setupStatNameLabel()
    }
}

// MARK: - Layout

extension StatView {
    
    private func setupStatValueLabel() {
        statValueLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(statValueLabel)
        statValueLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        statValueLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        statValueLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    private func setupStatNameLabel() {
        statNameLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(statNameLabel)
        statNameLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        statNameLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        statNameLabel.leftAnchor.constraint(equalTo: statValueLabel.rightAnchor, constant: LayoutConstants.statValueAndNameSpacing).isActive = true
    }
}

// MARK: - Design

extension StatView {
    
    private func desing() {
        
    }
}

// MARK: - Constans

extension StatView {
    
    enum LayoutConstants {
        static let statValueAndNameSpacing: CGFloat = 8
    }
}
