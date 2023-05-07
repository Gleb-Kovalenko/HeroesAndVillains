//
//  SuperhumansListViewController.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 20.09.2022.
//

import UIKit
import TransitionHandler

// MARK: - SuperhumansListViewController

public final class SuperhumansListViewController: UIViewController {
    
    // MARK: - Properties
    
    /// Presenter instance
    var output: SuperhumanViewOutput?
    
    /// Current superhumans type
    private var data: SuperhumanListModule.Data
    
    /// Table with superhuman cells
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.contentInset = Constants.contentInsets
        return tableView
    }()
    
    /// Filter by favorti button
    var favoriteFilterButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "unfilledStar"), for: .normal)
        button.setImage(UIImage(named: "filledStar"), for: .selected)
        button.addTarget(self, action: #selector(favoriteFilter), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Initializers

    /// Default initializer
    /// - Parameters:
    ///   - data: Selected superhuman's data
    public init(data: SuperhumanListModule.Data) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required convenience init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ViewController
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        design()
        localize()
        setupLayout()
        output?.didTriggerViewReadyEvent()
    }
}

// MARK: - Localization

extension SuperhumansListViewController {
    
    private func localize() {
        navigationItem.title = data.title
    }
}

// MARK: ButtonAction

extension SuperhumansListViewController {
    
    @objc func favoriteFilter() {
        favoriteFilterButton.startAnimation(
            duration: Constants.favoriteFilterButtonAnimationDuration,
            animation: ViewAnimationStyle.transformSize(scale: Constants.favoriteFilterButtonAnimationSizeScaling),
            completionBlock: ViewAnimationStyle.setDefaultSize.animate(favoriteFilterButton)
        )
        favoriteFilterButton.isSelected = !favoriteFilterButton.isSelected
        output?.didTriggerFavoriteFilterButtonTapped(isFavoriteFilterActive: favoriteFilterButton.isSelected)
    }
}

// MARK: - Layout

extension SuperhumansListViewController {
    
    private func setupLayout() {
        setupTableView()
        setupNavigatioBar()
        setupFavoriteFilterButton()
    }
    
    /// Setup table with superhumans cards
    private func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.fullPinTo(view: view)
    }
    
    private func setupFavoriteFilterButton() {
        favoriteFilterButton.translatesAutoresizingMaskIntoConstraints = false
        tableView.addSubview(favoriteFilterButton)
        favoriteFilterButton.rightAnchor.constraint(equalTo: tableView.rightAnchor, constant: 50).isActive = true
        favoriteFilterButton.topAnchor.constraint(equalTo: tableView.topAnchor, constant: 36).isActive = true
    }
    
    private func setupNavigatioBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
    }
}

// MARK: - Design

extension SuperhumansListViewController {
    
    private func design() {
        tableView.backgroundColor = .black
    }
}

// MARK: - SuperhumanViewInput

extension SuperhumansListViewController: SuperhumanViewInput {
    
    public var isFavoriteFilterActive: Bool {
        favoriteFilterButton.isSelected
    }
    
    public func setupInitialState() {
    }
    
    public func selectSuperhuman(_ code: String) {
        //Later
    }
}

// MARK: - ViperViewOutputProvider

extension SuperhumansListViewController: ViewOutputProvider {

    public var viewOutput: ModuleInput? {
        output as? ModuleInput
    }
}

// MARK: - Constants

extension SuperhumansListViewController {
    
    enum Constants {
        static let favoriteFilterButtonAnimationDuration = 0.2
        static let favoriteFilterButtonAnimationSizeScaling = 1.1
        static let contentInsets: UIEdgeInsets = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
    }
}
