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
    
    /// Table cell instance
    private var cellView: SuperhumanCell = {
        let cell = SuperhumanCell()
        cell.setupSuperhumanImage(url: "spiderman")
        cell.setupHeaderLabelText(text: "Spiderman")
        return cell
    }()
    
    // MARK: - ViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        design()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        cellView.smoothCorners(radius: 24)
    }
    
    private func setupLayout() {
        setupCell()
    }
}

// MARK: - Layout

extension SuperhumansListViewController {
    
    private func setupCell() {
        cellView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cellView)
        cellView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        cellView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        cellView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        cellView.heightAnchor.constraint(equalToConstant: LayoutConstants.cellHeight).isActive = true
    }
}

// MARK: - Design

extension SuperhumansListViewController {
    
    private func design() {
        view.backgroundColor = .black
    }
}

// MARK: - Constants

extension SuperhumansListViewController {
    
    enum LayoutConstants {
        static let cellHeight: CGFloat = 196
    }
}
