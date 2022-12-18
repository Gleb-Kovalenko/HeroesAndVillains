//
//  SuperhumanCellPresenter.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 07.10.2022.
//

import Foundation
import GenericCellPresenters

// MARK: - SuperhumanCellPresenter

final public class SuperhumanCellPresenter: GenericCellPresenter<SuperhumanCell> {
    
    // MARK: - Properties
    
    /// ViewModel instance
    public var viewModel: SuperhumanCellViewModelProtocol
    
    /// SuperhumanService instance
    public let service: SuperhumanService
    
    /// Default initializer
    ///
    /// - Parameter viewModel: ViewModel instance
    public init(viewModel: SuperhumanCellViewModelProtocol, service: SuperhumanService) {
        self.viewModel = viewModel
        self.service = service
    }
    
    // MARK: - SuperhumanCellPresenter
    
    public override func configureCell(_ cell: SuperhumanCell) {
        cell.setup(viewModel: viewModel)
        cell.output = self
    }
    
    override public func cellSize(reusableCellHolder: UITableView) -> CGSize {
        CGSize(width: reusableCellHolder.frame.width, height: 196)
    }
    
    // MARK: - Useful
    
    public func updateCell(_ cell: SuperhumanCell) {
        cell.setup(viewModel: viewModel)
        reusableCellHolder?.reloadData()
    }
}

extension SuperhumanCellPresenter: SuperhumanCellOutput {
    
    public func didTriggerFavoriteButtonTappedEvent() {
        service
            .toogleFavorite(
                superhumanID: viewModel.superhuman.uniqueId,
                currentFavoriteState: viewModel.superhuman.isFavorite
            )
            .async()
            .success { plain in
                self.viewModel.isFavorite = plain.isFavorite
            }
            .failure { _ in }
    }
}
