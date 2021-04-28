//
//  ListBookmarkViewController+UI.swift
//  Mooovie
//
//  Created by aku pintar indonesia on 28/04/21.
//

import UIKit

extension ListBookmarkViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    func setupUI() {
        self.title = "Bookmarks"
        
        view.addSubview(cvBookmark)
        
        setupCvBookmark()
    }
    
    private func setupCvBookmark() {
        cvBookmark.backgroundColor = .pureWhite
        cvBookmark.showsVerticalScrollIndicator = false
        cvBookmark.register(BookmarkCell.self, forCellWithReuseIdentifier: BookmarkCell.identifier)
        
        cvBookmark.translatesAutoresizingMaskIntoConstraints = false
        cvBookmark.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        cvBookmark.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        cvBookmark.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        cvBookmark.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
}



