//
//  SuperhumanContentManagerImplementation.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 21.10.2022.
//

import Foundation
import UIKit
import VIPER
import SDAO

// MARK: - SuperhumanContentManagerImplementation

final public class SuperhumanContentManagerImplementation: IntermediateContentManager<UITableView> {
    
    // MARK: - Properties
    
    /// Superhuman presenters factory
    private let presentersFactory: SuperhumanCellPresenterFactory

    /// Delegate instance
    public weak var delegate: SuperhumanContentManagerDelegate?
    
    /// Current controllers which manipulates tableView's cells
    private var controllers: [SuperhumanCellPresenter] = []
    
    // MARK: - Initializers
    
    /// Default initializer
    ///
    /// - Parameters:
    ///    - presentersFactory: superhuman presenters factory
    public init(
        presentersFactory: SuperhumanCellPresenterFactory
    ) {
        self.presentersFactory = presentersFactory
        super.init()
    }
}

// MARK: - SuperhumanContentManager

extension SuperhumanContentManagerImplementation: SuperhumanContentManager {
    
    public func selectSuperhuman(_ superhumanId: UniqueID) {
        //Later
    }
    
    public func updateData(_ viewModels: [SuperhumanCellViewModelProtocol]) {
        guard let tableView = contentView else {
            return
        }
        controllers = presentersFactory.controllers(with: viewModels, tableView: tableView)
        tableView.reloadData()
    }
}

// MARK: - UITableViewDelegate

extension SuperhumanContentManagerImplementation: UITableViewDelegate {

    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        controllers[indexPath.row].cellSize(reusableCellHolder: tableView).height
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = controllers[indexPath.row]
        delegate?.didSelectSuperhuman(controller.viewModel.superhuman)
    }
}

// MARK: - UITableViewDataSource

extension SuperhumanContentManagerImplementation: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        controllers.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = controllers[indexPath.row].cellFromReusableCellHolder(tableView, forIndexPath: indexPath) as? SuperhumanCell
        cell?.smoothCorners(radius: 24)
        cell?.selectionStyle = .none
        return cell.unwrap()
    }
}

// MARK: - Constants

extension SuperhumanContentManagerImplementation {
    
    enum LayoutConstants {
        static let cellSpacingHeight: CGFloat = 16
    }
}
