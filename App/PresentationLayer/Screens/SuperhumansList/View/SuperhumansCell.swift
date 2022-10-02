//
//  SuperhumansCell.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 21.09.2022.
//

import Foundation
import UIKit

// MARK: - SuperhumansCell

final public class SuperhumanCell: UIView {
        
    // MARK: - Properties

    /// General cell container view
    private let containerView = UIView()

    /// Cell container with info about superhuman
    private let infoContainerView = UIView()

    /// Stack view with superhuman's stats
    private let statsStackView: UIStackView =  {
        let stackView = UIStackView()
        stackView.spacing = LayoutConstants.statLineSpacing
        stackView.axis = .vertical
        stackView.alignment = .leading
        return stackView
    }()

    /// Cell header instance
    private let cellHeaderView = UIView()

    /// Superhuman's image view instance
    private let imageView = UIImageView()

    /// Favorite button instance
    private let favoriteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "unfilledStar"), for: .normal)
        return button
    }()

    /// Header label instance
    private let headerLabelView: UILabel =  {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        return label
    }()

    // MARK: - СellView

    init() {
        super.init(frame: .zero)
        setupLayout()
        design()
        fillStack()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Useful
    
    public func setup(headerText: String, imageUrl: String) {
        headerLabelView.text = headerText
        imageView.image = UIImage(named: imageUrl)
    }
    
    // MARK: - Private
    
    private func fillStack() {
        for i in 1...6 {
            let statView = StatView()
            statView.setupText(statValue: i + 21, statName: "StatName\(i)")
            statsStackView.addArrangedSubview(statView)
        }
    }
}
// MARK: - Layout

extension SuperhumanCell {
    
    private func setupLayout() {
        setupContainerView()
        setupImageView()
        setupInfoContainerView()
        setupHeaderView()
        setupFavoriteButton()
        setupHeaderLabelView()
        setupStackView()
    }

    private func setupContainerView() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(containerView)
        containerView.fullPinTo(view: self, with: LayoutConstants.containerViewInsets)
    }
    
    private func setupImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(imageView)
        imageView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: LayoutConstants.imageViewRightPadding).isActive = true
    }
    
    private func setupInfoContainerView() {
        infoContainerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(infoContainerView)
        infoContainerView.heightAnchor.constraint(equalTo: containerView.heightAnchor).isActive = true
        infoContainerView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        infoContainerView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
    }
    
    private func setupHeaderView() {
        cellHeaderView.translatesAutoresizingMaskIntoConstraints = false
        infoContainerView.addSubview(cellHeaderView)
        cellHeaderView.topAnchor.constraint(equalTo: infoContainerView.topAnchor).isActive = true
        cellHeaderView.leftAnchor.constraint(equalTo: infoContainerView.leftAnchor).isActive = true
        cellHeaderView.rightAnchor.constraint(equalTo: infoContainerView.rightAnchor).isActive = true
        cellHeaderView.heightAnchor.constraint(equalToConstant: LayoutConstants.cellHeaderHeight).isActive = true
    }
    
    private func setupFavoriteButton() {
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        cellHeaderView.addSubview(favoriteButton)
        favoriteButton.leftAnchor.constraint(equalTo: cellHeaderView.leftAnchor).isActive = true
        favoriteButton.topAnchor.constraint(equalTo: cellHeaderView.topAnchor).isActive = true
        favoriteButton.heightAnchor.constraint(equalToConstant: LayoutConstants.favoriteButtonHeight).isActive = true
    }
    
    private func setupHeaderLabelView() {
        headerLabelView.translatesAutoresizingMaskIntoConstraints = false
        cellHeaderView.addSubview(headerLabelView)
        headerLabelView.leftAnchor.constraint(equalTo: favoriteButton.rightAnchor, constant: LayoutConstants.headerButtonAndLabelSpacing).isActive = true
        headerLabelView.rightAnchor.constraint(equalTo: cellHeaderView.rightAnchor).isActive = true
        headerLabelView.centerYAnchor.constraint(equalTo: favoriteButton.centerYAnchor).isActive = true
    }
    
    private func setupStackView() {
        statsStackView.translatesAutoresizingMaskIntoConstraints = false
        infoContainerView.addSubview(statsStackView)
        statsStackView.topAnchor.constraint(equalTo: cellHeaderView.bottomAnchor, constant: LayoutConstants.statsStackViewTopPadding).isActive = true
        statsStackView.leftAnchor.constraint(equalTo: infoContainerView.leftAnchor).isActive = true
        statsStackView.rightAnchor.constraint(equalTo: infoContainerView.rightAnchor).isActive = true
        statsStackView.bottomAnchor.constraint(equalTo: infoContainerView.bottomAnchor).isActive = true
    }
}

// MARK: - Design

extension SuperhumanCell {
    
    private func design() {
        backgroundColor = UIColor(red: 0.345, green: 0.02, blue: 0.055, alpha: 1)
        headerLabelView.textColor = .white
    }
}

// MARK: - Constants

extension SuperhumanCell {
    
    enum LayoutConstants {
        static let containerViewInsets = UIEdgeInsets(top: 12, left: 16, bottom: -12, right: 0)
        static let imageViewRightPadding: CGFloat = -45
        static let cellHeaderHeight: CGFloat = 30
        static let statsStackViewTopPadding: CGFloat = 12
        static let statLineSpacing: CGFloat = 1.3
        static let headerButtonAndLabelSpacing: CGFloat = 8
        static let favoriteButtonHeight: CGFloat = 30
    }
}
