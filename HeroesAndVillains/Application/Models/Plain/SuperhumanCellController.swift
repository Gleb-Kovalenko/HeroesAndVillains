//
//  SuperhumanCellController.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 07.10.2022.
//

import Foundation
import GenericCellPresenters

// MARK: - SuperhumanCellController

final public class SuperhumanCellController: GenericCellPresenter<SuperhumanCell> {
    
    // MARK: - Properties
    
    /// ViewModel instance
    public var viewModel: SuperhumanCellViewModelProtocol
    
    /// Default initializer
    ///
    /// - Parameter viewModel: ViewModel instance
    public init(viewModel: SuperhumanCellViewModelProtocol) {
        self.viewModel = viewModel
    }
    
    // MARK: - SuperhumanCellController
    
    public override func configureCell(_ cell: SuperhumanCell) {
        cell.setup(viewModel: viewModel)
    }
    
    override public func cellSize(reusableCellHolder: UITableView) -> CGSize {
        CGSize(width: reusableCellHolder.frame.width, height: 196)
    }
}
