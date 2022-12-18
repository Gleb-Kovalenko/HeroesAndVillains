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
        switch data {
        case .villains:
            navigationItem.title = "Supervillains"
        case .heroes:
            navigationItem.title = "Superheroes"
        }
        // TODO: - Сделать в енуме свойство и там брать тайтл
    }
}

// MARK: - Layout

extension SuperhumansListViewController {
    
    private func setupLayout() {
        setupNavigatioBar()
    }
    
    /// Setup table with superhumans cards
    private func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.fullPinTo(view: view)
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
    
    public func setupInitialState() {
        setupTableView()
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
