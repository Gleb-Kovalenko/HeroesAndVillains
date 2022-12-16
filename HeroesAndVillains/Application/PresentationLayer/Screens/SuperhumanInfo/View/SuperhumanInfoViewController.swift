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
    
    private func setGradient(startColor: UIColor, endColor: UIColor = UIColor(.black)) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.locations = [0, 1]
        gradientLayer.startPoint = CGPoint(x: 0.25, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.75, y: 0.5)
        gradientLayer.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 1, c: -1, d: 0, tx: 1, ty: 0))
        gradientLayer.position = view.center
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
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
        setGradient(startColor: UIColor(hex: data.backgroundColorHex) ?? UIColor(.blue))
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

// MARK: - Design

extension SuperhumanInfoViewController {
    
    func design() {
        headerLabelView.textColor = .white
        favoriteButton.setTitleColor(UIColor(hex: "FF9F0A"), for: .normal)
        favoriteButton.layer.borderColor = UIColor(hex: "FF9F0A")?.cgColor
        favoriteButton.backgroundColor = .clear
        headerLabelView.font = UIFont.systemFont(ofSize: LayoutConstants.headerLabelViewFontSize, weight: .semibold)
    }
}

// MARK: - SuperhumanInfoViewInput

extension SuperhumanInfoViewController: SuperhumanInfoViewInput {

    public func setupInitialState() {
        setContent(from: data)
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
    }
}
