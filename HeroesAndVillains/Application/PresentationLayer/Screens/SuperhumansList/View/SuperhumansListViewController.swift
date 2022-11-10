//
//  SuperhumansListViewController.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 20.09.2022.
//

import UIKit

// MARK: - SuperhumansListViewController

final class SuperhumansListViewController: UIViewController {
    
    // MARK: - Properties
    
    /// Presenter instance
    var output: SuperhumanViewOutput?
    
    /// Superhuman content manager
    var contentManager: SuperhumanContentManager?
    
    /// Table with superhuman cells
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.contentInset = LayoutConstants.contentInsets
        return tableView
    }()
    
    // MARK: - ViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentManager = SuperhumanContentManagerImplementation(tableView: tableView, presentersFactory: SuperhumanCellPresenterFactoryImplementation())
        output = SuperhumanListPresenter(
            superhumanCellViewModelDesigner: SuperhumanCellViewModelDesignerImplementation(),
            superhumanViewInput: self
        )
        design()
        output?.didTriggerViewReadyEvent()
    }
}

// MARK: - Layout

extension SuperhumansListViewController {
    
    /// Setup table with superhumans cards
    private func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.fullPinTo(view: view)
        contentManager?.configure(withContentView: tableView)
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
    
    func setupInitialState() {
        setupTableView()
    }
    
    func update(_ viewModels: [SuperhumanCellViewModelProtocol]) {
        contentManager?.updateData(viewModels)
    }
    
    func selectSuperhuman(_ code: String) {
        //Later
    }
}

// MARK: - Constants

extension SuperhumansListViewController {
    
    enum LayoutConstants {
        static let contentInsets: UIEdgeInsets = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
    }
}
