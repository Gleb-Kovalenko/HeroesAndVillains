//
//  SuperhumansListViewController.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 20.09.2022.
//

import UIKit

// MARK: - SuperhumansListViewController

public final class SuperhumansListViewController: UIViewController {
    
    // MARK: - Properties
    
    /// Presenter instance
    var output: SuperhumanViewOutput?
    
    /// Table with superhuman cells
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.contentInset = LayoutConstants.contentInsets
        return tableView
    }()
    
    // MARK: - ViewController
    
    public override func viewDidLoad() {
        super.viewDidLoad()
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

// MARK: - Constants

extension SuperhumansListViewController {
    
    enum LayoutConstants {
        static let contentInsets: UIEdgeInsets = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
    }
}
