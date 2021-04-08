//
//  ListViewController+UI.swift
//  Mooovie
//
//  Created by aku pintar indonesia on 08/04/21.
//

import Foundation

extension ListViewController {
    
    func setupUI() {
        self.title = "Mooovie"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.view.backgroundColor = .white
        
        view.addSubview(cvMovie)
        
        setupCvMovie()
    }
    
    private func setupCvMovie() {
        cvMovie.backgroundColor = .clear
        cvMovie.showsVerticalScrollIndicator = false
        cvMovie.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.identifier)
        
        cvMovie.translatesAutoresizingMaskIntoConstraints = false
        cvMovie.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        cvMovie.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        cvMovie.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        cvMovie.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
}
