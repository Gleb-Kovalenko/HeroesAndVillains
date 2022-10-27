//
//  SuperhumansCell.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 21.09.2022.
//

import Foundation
import Kingfisher
import UIKit

// MARK: - SuperhumansCell

final public class SuperhumanCell: UITableViewCell {
        
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
    private let superhumanImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()

    /// Favorite button instance
    private let favoriteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "unfilledStar"), for: .normal)
        return button
    }()

    /// Header label instance
    private let headerLabelView: UILabel =  {
        let label = UILabel()
        label.minimumScaleFactor = 0.38
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        return label
    }()

    // MARK: - UITableViewCell

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
        design()
    }
    
    override public func layoutIfNeeded() {
        super.layoutIfNeeded()
        containerView.smoothCorners(radius: 24)
    }

    // MARK: - Useful
    
    public func setup(viewModel: SuperhumanCellViewModelProtocol) {
        headerLabelView.text = viewModel.name
        superhumanImageView.kf.setImage(with: viewModel.imageUrl)
        setStats(with: viewModel)
        containerView.backgroundColor = UIColor(hex: viewModel.backgroundColorHex)
        backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        contentView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
    }
    
    // MARK: - Private
    
    private func setStats(with viewModel: SuperhumanCellViewModelProtocol) {
        if statsStackView.subviews.isEmpty {
            for i in 0...5 {
                let statView = StatView()
                let shortName = viewModel.stats[i].shortName
                let value = viewModel.stats[i].value
                statView.setupText(statValue: value, statName: shortName)
                statsStackView.addArrangedSubview(statView)
            }
        }
    }
}
// MARK: - Layout

extension SuperhumanCell {
    
    private func setupLayout() {
        setupContainerView()
        setupInfoContainerView()
        setupImageView()
        setupHeaderView()
        setupFavoriteButton()
        setupHeaderLabelView()
        setupStackView()
    }
    
    private func setupContainerView() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(containerView)
        containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: LayoutConstants.containerViewBottomPadding).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: LayoutConstants.containerViewHeight).isActive = true
    }
    
    private func setupImageView() {
        superhumanImageView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(superhumanImageView)
        superhumanImageView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: LayoutConstants.imageViewInsets.right).isActive = true
        superhumanImageView.widthAnchor.constraint(equalToConstant: LayoutConstants.imageWidth).isActive = true
        superhumanImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: LayoutConstants.imageViewInsets.top).isActive = true
        superhumanImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: LayoutConstants.imageViewInsets.bottom).isActive = true
    }
    
    private func setupInfoContainerView() {
        infoContainerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(infoContainerView)
        infoContainerView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: LayoutConstants.infoContainerInsets.left).isActive = true
        infoContainerView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: LayoutConstants.infoContainerInsets.top).isActive = true
        infoContainerView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: LayoutConstants.infoContainerInsets.bottom).isActive = true
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
        headerLabelView.textColor = .white
    }
}

// MARK: - Constants

extension SuperhumanCell {
    
    enum LayoutConstants {
        static let containerViewBottomPadding: CGFloat = 12
        static let containerViewHeight: CGFloat = 196
        static let imageViewInsets: UIEdgeInsets = UIEdgeInsets(top: 16, left: 0, bottom: -16, right: -16)
        static let infoContainerInsets: UIEdgeInsets = UIEdgeInsets(top: 12, left: 16, bottom: -12, right: 0)
        static let cellHeaderHeight: CGFloat = 28
        static let statsStackViewTopPadding: CGFloat = 12
        static let statLineSpacing: CGFloat = 1.3
        static let headerButtonAndLabelSpacing: CGFloat = 8
        static let favoriteButtonHeight: CGFloat = 30
        static let imageWidth: CGFloat = 164
    }
}
