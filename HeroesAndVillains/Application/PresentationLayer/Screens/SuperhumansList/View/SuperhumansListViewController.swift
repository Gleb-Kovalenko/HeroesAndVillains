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
        setupInitialState()
        design()
        let superhumansPlainObjects = try! obtain()
        let viewModels = viewModels(from: superhumansPlainObjects)
        update(viewModels)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}

// MARK: - For test

extension SuperhumansListViewController {

    func viewModels(from plainObjects: [SuperhumanPlainObject]) -> [SuperhumanCellViewModelProtocol] {
        plainObjects.reduce(into: [SuperhumanCellViewModelProtocol]()) { result, elem in
            result.append(SuperhumanCellViewModel(superhuman: elem))
        }
    }
    
    public func obtain() throws -> [SuperhumanPlainObject] {
        
        let decoder = JSONDecoder()
        do {
            let fileUrl = Bundle.main.url(forResource: "SuperhumansInfo", withExtension: "json")
            let data = try? Data(contentsOf: fileUrl.unwrap())
            let plains = try decoder.decode([SuperhumanPlainObject].self, from: data.unwrap())
            return plains
        } catch let error {
            throw error
        }
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
