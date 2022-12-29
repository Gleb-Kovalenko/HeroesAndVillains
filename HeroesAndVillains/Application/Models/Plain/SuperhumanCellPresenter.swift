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
    
    /// Flag indicating that the cell should be closed
    var isNeedToClose: Bool {
        cellHeight == 0
    }
    
    /// Это не работает, но пока оставил здесь(всегда выдается false и сообщение в консоль)
//    var isOnTableView: Bool {
//
//        guard let cell = currentCell(), let reusableCellHolder = reusableCellHolder else {
//            return false
//        }
//        return reusableCellHolder.visibleCells.contains(cell)
//    }
    /// Пока оставил это
    var isOnTableView = false
    
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
    
    public override func willDisplayCell(_ cell: SuperhumanCell) {
        
        guard let indexPath = indexPath else {
            return
        }
        
        if !isOnTableView {
            cell.startAnimation(
                duration: 0.4,
                delay: 0.1 * Double(indexPath.row + 1),
                animation: CellAnimationStyle.slideRightToLeft
            )
            isOnTableView = true
        }
    }
    
    // MARK: - Useful
    
    public func updateCell(_ cell: SuperhumanCell) {
        cell.setup(viewModel: viewModel)
        reusableCellHolder?.reloadData()
    }
}

// MARK: - CellOutput

extension SuperhumanCellPresenter: SuperhumanCellOutput {
    
    public func didTriggerFavoriteButtonTappedEvent() {
        superhumanService
            .toggleFavorite(superhumanID: viewModel.superhuman.uniqueId)
            .async()
            .success { [self] plain in
                viewModel = SuperhumanCellViewModel(superhumanPlainObject: plain)
                if isNeedToClose {
                    guard let cell = currentCell() else {
                        return
                    }
                    cell.startAnimation(
                        animation: CellAnimationStyle.slideLeftToRight,
                        completionBlock: {
                            isOnTableView = false
                            reusableCellHolder?.reloadData()
                        }
                    )
                } else {
                    reusableCellHolder?.reloadData()
                }
            }
            .failure { _ in }
    }
}
