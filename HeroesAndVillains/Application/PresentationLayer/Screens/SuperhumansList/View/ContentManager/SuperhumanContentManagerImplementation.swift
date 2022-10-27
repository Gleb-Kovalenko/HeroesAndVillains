//
//  SuperhumanContentManagerImplementation.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 21.10.2022.
//

import Foundation
import UIKit
import VIPER

// MARK: - SuperhumanContentManagerImplementation

final public class SuperhumanContentManagerImplementation: IntermediateContentManager<UITableView> {
    
    // MARK: - Properties
    
    /// Superhuman controllers factory
    private let controllersFactory: SuperhumanCellControllerFactory

    /// Current controllers which manipulates tableView's cells
    private var controllers: [SuperhumanCellController] = []
    
    // MARK: - Initializers
    
    /// Default initializer
    ///
    /// - Parameter controllersFactory: superhuman controllers factory
    public init(controllersFactory: SuperhumanCellControllerFactory) {
        self.controllersFactory = controllersFactory
        super.init()
    }
}

// MARK: - SuperhumanContentManager

extension SuperhumanContentManagerImplementation: SuperhumanContentManager {
    
    public func selectSuperhuman(_ superhumanName: String) {
        //Later
    }
    
    public func updateData(_ viewModels: [SuperhumanCellViewModelProtocol]) {
        guard let tableView = contentView else {
            return
        }
        controllers = controllersFactory.controllers(with: viewModels, tableView: tableView)
        tableView.reloadData()
    }
}

// MARK: - UITableViewDelegate

extension SuperhumanContentManagerImplementation: UITableViewDelegate {

    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        controllers[indexPath.row].cellSize(reusableCellHolder: tableView).height
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Later
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
