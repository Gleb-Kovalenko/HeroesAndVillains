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
    var isShouldBeHidden: Bool {
        cellHeight == 0
    }
    
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
        
        guard let indexPath = indexPath else { return }
        
        if !isOnTableView {
            cell.startAnimation(
                duration: Constants.cellAnimationDuration,
                delay: Constants.cellAnimationDelay(on: indexPath.row),
                animation: ViewAnimationStyle.slideRightToLeft
            )
            isOnTableView = true
        }
    }
    
    public override func didEndDisplayingCell(_ cell: SuperhumanCell) {
        isOnTableView = false
    }
    
    public override func didHighlightCell() {
        
        currentCell()?.startAnimation(
            duration: Constants.cellAnimationDuration,
            animation: ViewAnimationStyle.transformSize(scale: Constants.cellAnimationSizeScaling)
        )
    }
    
    public override func didUnhighlightCell() {
        
        currentCell()?.startAnimation(
            duration: Constants.cellAnimationDuration,
            animation: ViewAnimationStyle.setDefaultSize
        )
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
                if isShouldBeHidden {
                    guard let cell = currentCell() else {
                        return
                    }
                    cell.startAnimation(
                        animation: ViewAnimationStyle.slideLeftToRight,
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

// MARK: - NSObject

extension SuperhumanCellPresenter {
    
    override public var hash: Int {
        return viewModel.superhuman.uniqueId.hashValue
    }
    
    public override func isEqual(_ object: Any?) -> Bool {
        
        guard let cellPresenter = object as? SuperhumanCellPresenter else {
            return false
        }
        return viewModel.superhuman.uniqueId == cellPresenter.viewModel.superhuman.uniqueId
    }
}

// MARK: - Constants

extension SuperhumanCellPresenter {
    
    enum Constants {
        static let cellAnimationDuration = 0.4
        static let cellAnimationSizeScaling = 1.05
        static let cellAnimationDelay = 0.1
        static func cellAnimationDelay(on row: Int) -> Double {
            cellAnimationDelay * Double(row + 1)
        }
    }
}
