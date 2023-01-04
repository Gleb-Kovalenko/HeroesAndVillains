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
    
    /// Current presenters which manipulates tableView's cells
    private var presenters: [SuperhumanCellPresenter] = []
    
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
    
    public func updateCellViewModel(with viewModel: SuperhumanCellViewModelProtocol) {
        guard
            let cellPresenter = presenters.first(where: { $0.viewModel.superhuman.uniqueId == viewModel.superhuman.uniqueId }),
            let cell = cellPresenter.currentCell()
        else {
            return
        }
        cellPresenter.viewModel = SuperhumanCellViewModel(superhumanPlainObject: viewModel.superhuman)
        cellPresenter.updateCell(cell)
    }
    
    public func updateData(_ viewModels: [SuperhumanCellViewModelProtocol]) {
        guard let tableView = contentView else {
            return
        }
        presenters
            .filter { $0.isNeedToClose }
            .compactMap { $0.currentCell() }
            .startAnimations(
                animation: AnimationStyleTypes.slideLeftToRight,
                then: { [self] in
                    let factoryPresenters = presentersFactory.presenters(with: viewModels, tableView: tableView)
                    presenters = presenters.duplicatesAndUnique(from: factoryPresenters)
                    tableView.reloadData()
                }
            )
    }
}

// MARK: - UITableViewDelegate

extension SuperhumanContentManagerImplementation: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        presenters[indexPath.row].didUnhighlightCell()
    }
    
    public func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        presenters[indexPath.row].didHighlightCell()
    }
    
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let cell = cell as? SuperhumanCell else {
            return
        }
        presenters[indexPath.row].willDisplayCell(cell)
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        presenters[indexPath.row].cellSize(reusableCellHolder: tableView).height
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = presenters[indexPath.row]
        delegate?.didSelectSuperhuman(controller.viewModel.superhuman)
    }
}

// MARK: - UITableViewDataSource

extension SuperhumanContentManagerImplementation: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenters.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = presenters[indexPath.row].cellFromReusableCellHolder(tableView, forIndexPath: indexPath) as? SuperhumanCell
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
