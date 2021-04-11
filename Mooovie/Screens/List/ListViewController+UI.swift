//
//  ListViewController+UI.swift
//  Mooovie
//
//  Created by aku pintar indonesia on 08/04/21.
//

import UIKit

extension ListViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    func setupUI() {
        self.title = "Mooovie"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.view.backgroundColor = .pureWhite
        
        view.addSubview(vCategory)
        vCategory.addSubview(scCategory)
        view.addSubview(cvMovie)
        
        setupVCategory()
        setupScCategory()
        setupCvMovie()
    }
    
    private func setupVCategory() {
        vCategory.backgroundColor = .maximumRed
        
        vCategory.translatesAutoresizingMaskIntoConstraints = false
        vCategory.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        vCategory.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        vCategory.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        vCategory.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    private func setupScCategory() {
        scCategory.selectedSegmentIndex = 0
        scCategory.backgroundColor = .clear
        scCategory.selectedSegmentTintColor = .pureWhite
        scCategory.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.pureWhite], for: .normal)
        scCategory.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.maximumRed], for: .selected)
        
        scCategory.translatesAutoresizingMaskIntoConstraints = false
        scCategory.centerXAnchor.constraint(equalTo: vCategory.centerXAnchor).isActive = true
        scCategory.centerYAnchor.constraint(equalTo: vCategory.centerYAnchor).isActive = true
    }
    
    private func setupCvMovie() {
        cvMovie.backgroundColor = .clear
        cvMovie.showsVerticalScrollIndicator = false
        cvMovie.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.identifier)
        
        cvMovie.translatesAutoresizingMaskIntoConstraints = false
        cvMovie.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        cvMovie.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        cvMovie.topAnchor.constraint(equalTo: vCategory.bottomAnchor).isActive = true
        cvMovie.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
}
