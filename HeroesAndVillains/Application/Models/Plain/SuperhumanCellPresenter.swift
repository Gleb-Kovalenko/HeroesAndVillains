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
    
    /// View instance
    private let view: SuperhumanViewInput
    
    /// SuperhumanService instance
    public let superhumanService: SuperhumanService
    
    /// Calculated cell height
    private var cellHeight: Double {
        viewModel.isFavorite != view.isFavoriteFilterActive && view.isFavoriteFilterActive ? 0 : 196
    }
    
    /// Default initializer
    ///
    /// - Parameters:
    ///    - viewModel: ViewModel instance
    ///    - superhumanService: SuperhumanService instance
    ///    - view: SuperhumansListViewController instance
    public init(
        viewModel: SuperhumanCellViewModelProtocol,
        superhumanService: SuperhumanService,
        view: SuperhumanViewInput
    ) {
        self.view = view
        self.viewModel = viewModel
        self.superhumanService = superhumanService
    }
    
    // MARK: - SuperhumanCellPresenter
    
    public override func configureCell(_ cell: SuperhumanCell) {
        cell.setup(viewModel: viewModel)
        cell.output = self
    }
    
    override public func cellSize(reusableCellHolder: UITableView) -> CGSize {
        CGSize(width: reusableCellHolder.frame.width, height: cellHeight)
    }
    
    // MARK: - Useful
    
    public func updateCell(_ cell: SuperhumanCell) {
        cell.setup(viewModel: viewModel)
        reusableCellHolder?.reloadData()
    }
}

extension SuperhumanCellPresenter: SuperhumanCellOutput {
    
    public func didTriggerFavoriteButtonTappedEvent() {
        superhumanService
            .toggleFavorite(superhumanID: viewModel.superhuman.uniqueId)
            .async()
            .success { [self] plain in
                viewModel = SuperhumanCellViewModel(superhumanPlainObject: plain)
                reusableCellHolder?.reloadData()
            }
            .failure { _ in }
    }
}
