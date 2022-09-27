//
//  SuperhumansListViewController.swift
//  HeroesAndVillains
//
//  Created by Gleb Kovalenko on 20.09.2022.
//

import UIKit

// MARK: - SuperhumansListViewController

final class SuperhumansListViewController: UIViewController {
    
    private var cellView = UIView()
    private var containerView = UIView()
    private var infoContainerView = UIView()
    private var stackView = UIStackView()
    private var imageView = UIImageView()
    private var cellHeaderView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        cellView.backgroundColor = UIColor(red: 0.345, green: 0.02, blue: 0.055, alpha: 1)
        cellView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(cellView)
        
        setupLayout()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        cellView.smoothCorners(radius: 24)
    }
    
    private func setupLayout() {
        setupContainerView()
        setupImageView()
        setupInfoContainerView()
        setupHeaderView()
        setupStackView()
        setupConstraints()
    }
    
    private func setupHeaderView() {
        cellHeaderView.translatesAutoresizingMaskIntoConstraints = false
        infoContainerView.addSubview(cellHeaderView)
        
        let favoriteButton = UIButton()
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.setImage(UIImage(named: "unfilledStar"), for: .normal)
        
        let labelView = UILabel()
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.text = "Spiderman"
        labelView.textColor = .white
        labelView.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        
        cellHeaderView.addSubview(favoriteButton)
        cellHeaderView.addSubview(labelView)
        
        favoriteButton.leftAnchor.constraint(equalTo: cellHeaderView.leftAnchor).isActive = true
        favoriteButton.rightAnchor.constraint(equalTo: labelView.leftAnchor, constant: -8).isActive = true
        favoriteButton.topAnchor.constraint(equalTo: cellHeaderView.topAnchor).isActive = true
        favoriteButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        labelView.leftAnchor.constraint(equalTo: favoriteButton.rightAnchor, constant: 8).isActive = true
        labelView.rightAnchor.constraint(equalTo: cellHeaderView.rightAnchor).isActive = true
        labelView.centerYAnchor.constraint(equalTo: favoriteButton.centerYAnchor).isActive = true
    }
    
    private func setupStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        infoContainerView.addSubview(stackView)
        fillStack()
    }
    
    private func fillStack() {
        for i in 1...6 {
            let statView = UIView()
            statView.translatesAutoresizingMaskIntoConstraints = false
            stackView.addSubview(statView)
            if stackView.subviews.count == 1 {
                statView.topAnchor.constraint(equalTo: stackView.topAnchor, constant: -1.3).isActive = true
                statView.leftAnchor.constraint(equalTo: stackView.leftAnchor).isActive = true
                statView.rightAnchor.constraint(equalTo: stackView.rightAnchor).isActive = true
            } else {
                statView.topAnchor.constraint(equalTo: stackView.subviews[stackView.subviews.count - 2].bottomAnchor, constant: 1.3).isActive = true
            }

            let statValueLabel = UILabel()
            statValueLabel.translatesAutoresizingMaskIntoConstraints = false
            statView.addSubview(statValueLabel)
            statValueLabel.text = "\(i + 21)"
            statValueLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
            statValueLabel.textColor = .white
            statValueLabel.textAlignment = .right
            
            statValueLabel.leftAnchor.constraint(equalTo: statView.leftAnchor).isActive = true
            statValueLabel.topAnchor.constraint(equalTo: statView.topAnchor).isActive = true
            statValueLabel.bottomAnchor.constraint(equalTo: statView.bottomAnchor).isActive = true

            let statNameLabel = UILabel()
            statNameLabel.translatesAutoresizingMaskIntoConstraints = false
            statView.addSubview(statNameLabel)
            statNameLabel.text = "StatName\(i)"
            statNameLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.38)
            statNameLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
            statNameLabel.topAnchor.constraint(equalTo: statView.topAnchor).isActive = true
            statNameLabel.rightAnchor.constraint(equalTo: statView.rightAnchor).isActive = true
            statNameLabel.leftAnchor.constraint(equalTo: statValueLabel.rightAnchor, constant: 8).isActive = true
        }
    }
        
    private func setupConstraints() {
        cellView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        cellView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        cellView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        cellView.heightAnchor.constraint(equalToConstant: 196).isActive = true
        
        containerView.fullPinTo(view: cellView, with: UIEdgeInsets(top: 12, left: 16, bottom: -12, right: 0))
        
        imageView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -45).isActive = true
        
        infoContainerView.heightAnchor.constraint(equalTo: containerView.heightAnchor).isActive = true
        infoContainerView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        infoContainerView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        
        cellHeaderView.topAnchor.constraint(equalTo: infoContainerView.topAnchor).isActive = true
        cellHeaderView.leftAnchor.constraint(equalTo: infoContainerView.leftAnchor).isActive = true
        cellHeaderView.rightAnchor.constraint(equalTo: infoContainerView.rightAnchor).isActive = true
        cellHeaderView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        stackView.topAnchor.constraint(equalTo: cellHeaderView.bottomAnchor, constant: 12).isActive = true
        stackView.leftAnchor.constraint(equalTo: infoContainerView.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: infoContainerView.rightAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: infoContainerView.bottomAnchor).isActive = true
    }
    
    private func setupInfoContainerView() {
        infoContainerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(infoContainerView)
    }
    
    private func setupImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "spiderman")
        containerView.addSubview(imageView)
    }
    
    private func setupContainerView() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        cellView.addSubview(containerView)
    }
}

