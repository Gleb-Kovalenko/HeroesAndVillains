//
//  SuperhumanInfoViewController.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 15.12.2022.
//

import Foundation
import UIKit
import VIPER
import TransitionHandler

// MARK: - SuperhumanInfoViewController

public final class SuperhumanInfoViewController: UIViewController {
    
    // MARK: - Properties
    
    /// Presenter instance
    var output: SuperhumanInfoViewOutput?
    
    /// Selected superhuman's data
    private var data: SuperhumanInfoModule.Data
    
    /// Header label instance
    private let headerLabelView: UILabel =  {
        let label = UILabel()
        label.minimumScaleFactor = 0.38
        return label
    }()
    
    /// Superhuman's image view instance
    private let superhumanImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    /// Stack view with superhuman's stats
    private let statsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = LayoutConstants.statLineSpacing
        stackView.axis = .vertical
        stackView.alignment = .leading
        return stackView
    }()
    
    /// Favorite button instance
    private let favoriteButton : UIButton = {
        let button = UIButton()
        button.layer.borderWidth = LayoutConstants.favoriteButtonBorderWidth
        button.layer.cornerRadius = LayoutConstants.favoriteButtonBorderRadius
        button.addTarget(self, action: #selector(favoritesAction), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Initializers

    /// Default initializer
    /// - Parameters:
    ///   - data: Selected superhuman's data
    public init(data: SuperhumanInfoModule.Data) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required convenience init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ViewController
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        design()
        localize()
        output?.didTriggerViewReadyEvent()
    }
    
    // MARK: - Private
    
    private func fillStackView(with stats: [StatPlainObject]) {
        for stat in stats {
            let statView = StatView()
            let shortName = stat.longName
            let value = stat.value
            statView.setupText(statValue: value, statName: shortName)
            statsStackView.addArrangedSubview(statView)
        }
    }
    
    private func setContent(from data: SuperhumanInfoModule.Data) {
        headerLabelView.text = data.name
        superhumanImageView.kf.setImage(with: data.imageURL)
        fillStackView(with: data.stats)
        favoriteButton.isSelected = data.isFavorite
        view.setGradient(startColor: UIColor(hex: data.backgroundColorHex) ?? UIColor(.blue))
    }
}

// MARK: - Layout

extension SuperhumanInfoViewController {
    
    private func setupLayout() {
        setupHeaderView()
        setupImageView()
        setupStackView()
        setupFavoriteButton()
    }
    
    private func setupHeaderView() {
        headerLabelView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerLabelView)
        headerLabelView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        headerLabelView.topAnchor.constraint(equalTo: view.topAnchor, constant: LayoutConstants.headerTopPadding).isActive = true
    }
    
    private func setupImageView() {
        superhumanImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(superhumanImageView)
        superhumanImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        superhumanImageView.topAnchor.constraint(equalTo: headerLabelView.bottomAnchor, constant: LayoutConstants.imageTopPadding).isActive = true
        superhumanImageView.heightAnchor.constraint(equalToConstant: LayoutConstants.imageHeight).isActive = true
    }
    
    private func setupStackView() {
        statsStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(statsStackView)
        statsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        statsStackView.topAnchor.constraint(equalTo: superhumanImageView.bottomAnchor, constant: LayoutConstants.stackTopPadding).isActive = true
    }
    
    private func setupFavoriteButton() {
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(favoriteButton)
        favoriteButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: LayoutConstants.favoriteButtonInsets.left).isActive = true
        favoriteButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: LayoutConstants.favoriteButtonInsets.right).isActive = true
        favoriteButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: LayoutConstants.favoriteButtonInsets.bottom).isActive = true
        favoriteButton.heightAnchor.constraint(equalToConstant: LayoutConstants.favoriteButtonHeight).isActive = true
    }
}

// MARK: - ButtonAction

extension SuperhumanInfoViewController {
    
    @objc func favoritesAction() {
        favoriteButton.isSelected = !favoriteButton.isSelected
        output?.didTriggerFavoriteButtonTappedEvent()
    }
}

// MARK: - Design

extension SuperhumanInfoViewController {
    
    func design() {
        headerLabelView.textColor = .white
        favoriteButton.layer.borderColor = UIColor(hex: LayoutConstants.yellowColorHex)?.cgColor
        favoriteButton.setTitleColor(UIColor(hex: LayoutConstants.yellowColorHex), for: .normal)
        favoriteButton.setBackgroundColor(
            color: .clear,
            cornerRadius: LayoutConstants.favoriteButtonBorderRadius,
            for: .normal
        )
        favoriteButton.setBackgroundColor(
            color: UIColor(hex: LayoutConstants.yellowColorHex),
            cornerRadius: LayoutConstants.favoriteButtonBorderRadius,
            for: .selected
        )
        favoriteButton.setTitleColor(UIColor(.black), for: .selected)
        headerLabelView.font = UIFont.systemFont(ofSize: LayoutConstants.headerLabelViewFontSize, weight: .semibold)
    }
}

// MARK: - SuperhumanInfoViewInput

extension SuperhumanInfoViewController: SuperhumanInfoViewInput {

    public func setupInitialState() {
        setContent(from: data)
    }
    
    public func undoFavoriteFilterChange() {
        favoriteButton.isSelected = !favoriteButton.isSelected
    }
}

// MARK: - ViperViewOutputProvider

extension SuperhumanInfoViewController: ViewOutputProvider {

    public var viewOutput: ModuleInput? {
        output as? ModuleInput
    }
}

// MARK: - Localization

extension SuperhumanInfoViewController {
    
    func localize() {
        favoriteButton.setTitle("Add to favorite", for: .normal)
        favoriteButton.setTitle("In favorites", for: .selected)
    }
}

// MARK: - Constants

extension SuperhumanInfoViewController {
    
    enum LayoutConstants {
        static let statLineSpacing: CGFloat = 16
        static let headerTopPadding: CGFloat = 9
        static let imageTopPadding: CGFloat = 40
        static let stackTopPadding: CGFloat = 40
        static let headerLabelViewFontSize: CGFloat = 22
        static let imageHeight: CGFloat = 164
        static let favoriteButtonBorderRadius: CGFloat = 16
        static let favoriteButtonInsets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: -8, right: -8)
        static let favoriteButtonBorderWidth: CGFloat = 2
        static let favoriteButtonHeight: CGFloat = 60
        static let yellowColorHex = "FF9F0A"
    }
}
