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
    
    /// SuperhumanCell output instance
    public weak var output: SuperhumanCellOutput?
    
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
        button.setImage(UIImage(named: "filledStar"), for: .selected)
        button.addTarget(self, action: #selector(favoritesAction), for: .touchUpInside)
        return button
    }()

    /// Header label instance
    let headerLabelView: UILabel =  {
        let label = UILabel()
        label.minimumScaleFactor = 0.38
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
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        for view in statsStackView.subviews {
            view.removeFromSuperview()
        }
    }

    // MARK: - Useful
    
    public func setup(viewModel: SuperhumanCellViewModelProtocol) {
        headerLabelView.text = viewModel.name
        superhumanImageView.kf.setImage(with: viewModel.imageURL)
        setStats(with: viewModel.stats)
        favoriteButton.isSelected = viewModel.isFavorite
        containerView.backgroundColor = UIColor(hex: viewModel.backgroundColorHex)
    }
    
    // MARK: - Private
    
    private func setStats(with stats: [StatPlainObject]) {
        for stat in stats {
            let statView = StatView()
            let shortName = stat.shortName
            let value = stat.value
            statView.setupText(statValue: value, statName: shortName)
            statsStackView.addArrangedSubview(statView)
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

// MARK: - ButtonAction

extension SuperhumanCell {
    
    @objc func favoritesAction() {
        
        favoriteButton.startAnimation(
            duration: 0.2,
            delay: 0,
            animation: AnimationStyleTypes.transformSize(scale: 1.3),
            completionBlock: AnimationStyleTypes.setDefaultSize.animate(favoriteButton)
        )
        favoriteButton.isSelected = !favoriteButton.isSelected
        output?.didTriggerFavoriteButtonTappedEvent()
    }
}

// MARK: - Design

extension SuperhumanCell {
    
    private func design() {
        headerLabelView.textColor = .white
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        headerLabelView.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
    }
}

// MARK: - Constants

extension SuperhumanCell {
    
    enum LayoutConstants {
        static let containerViewBottomPadding: CGFloat = -6
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
