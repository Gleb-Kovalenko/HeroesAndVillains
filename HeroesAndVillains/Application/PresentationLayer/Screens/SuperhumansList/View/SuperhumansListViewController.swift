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
        tableView.contentInset = LayoutConstants.contentInsets
        return tableView
    }()
    
    /// Filter by favorti button
    var favoriteFilterButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "unfilledStar"), for: .normal)
        button.setImage(UIImage(named: "filledStar"), for: .selected)
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
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        // TODO: - Спросить: Нужно ли это тут?(про isTranslucent)
        navigationController?.navigationBar.isTranslucent = false
    }
    
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
        switch data {
        case .villains:
            navigationItem.title = "Supervillains"
        case .heroes:
            navigationItem.title = "Superheroes"
        }
        // TODO: - Сделать в енуме свойство и там брать тайтл
    }
}

// MARK: ButtonAction

extension SuperhumansListViewController {
    
    @objc func favoriteFilter() {
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
        // TODO: - Утонить:
        // Прикол какой-то, если оставить как было, то тогда action у кнопки = nil, а так норм
        // Вообще пишут, мол swift не дает добавить таргет, если сущность еще не принадлежит к чему-либо
        // (что-то вроде этого). Короче, я без понятия, как сделать норм, но так работает
        favoriteFilterButton.addTarget(self, action: #selector(favoriteFilter), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: favoriteFilterButton)
    }
    
    private func setupNavigatioBar() {
        navigationItem.largeTitleDisplayMode = .automatic
    }
}

// MARK: - Design

extension SuperhumansListViewController {
    
    private func design() {
        tableView.backgroundColor = .black
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
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
    
    enum LayoutConstants {
        static let contentInsets: UIEdgeInsets = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
    }
}
