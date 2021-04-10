//
//  MovieCell+UI.swift
//  Mooovie
//
//  Created by aku pintar indonesia on 08/04/21.
//

import UIKit

extension MovieCell {
    
    func setupUI() {
        addSubViews()
        
        setupIvPoster()
        setupLbTitle()
        setupLbInfo()
        setupIvVote()
        setupLbVote()
    }
    
    private func addSubViews() {
        self.addSubview(ivPoster)
        self.addSubview(lbTitle)
        self.addSubview(lbInfo)
        self.addSubview(ivVote)
        self.addSubview(lbVote)
    }
    
    private func setupIvPoster() {
        ivPoster.contentMode = .scaleAspectFill
        ivPoster.backgroundColor = .prussianBlue
        ivPoster.layer.cornerRadius = 10
        ivPoster.layer.masksToBounds = true
        
        ivPoster.translatesAutoresizingMaskIntoConstraints = false
        ivPoster.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        ivPoster.widthAnchor.constraint(equalToConstant: 100).isActive = true
        ivPoster.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        ivPoster.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10).isActive = true
    }
    
    private func setupLbTitle() {
        lbTitle.text = "Godzilla and Kong Kong Kong Kong Kong"
        lbTitle.numberOfLines = 2
        lbTitle.font = .rounded(ofSize: 17, weight: .bold)
        lbTitle.textColor = .prussianBlue
        
        lbTitle.translatesAutoresizingMaskIntoConstraints = false
        lbTitle.leadingAnchor.constraint(equalTo: ivPoster.trailingAnchor, constant: 20).isActive = true
        lbTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        lbTitle.topAnchor.constraint(equalTo: ivPoster.topAnchor, constant: 30).isActive = true
    }
    
    private func setupLbInfo() {
        lbInfo.text = "Apr 8, 2021\t1h 34m\tR"
        lbInfo.font = .rounded(ofSize: 12, weight: .regular)
        lbInfo.textColor = .prussianBlue
        
        lbInfo.translatesAutoresizingMaskIntoConstraints = false
        lbInfo.leadingAnchor.constraint(equalTo: ivPoster.trailingAnchor, constant: 20).isActive = true
        lbInfo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        lbInfo.topAnchor.constraint(equalTo: lbTitle.bottomAnchor, constant: 10).isActive = true
    }
    
    private func setupIvVote() {
        ivVote.image = UIImage(systemName: "star.fill")
        ivVote.tintColor = .maximumYellow
        
        ivVote.translatesAutoresizingMaskIntoConstraints = false
        ivVote.leadingAnchor.constraint(equalTo: lbInfo.leadingAnchor).isActive = true
        ivVote.widthAnchor.constraint(equalToConstant: 10).isActive = true
        ivVote.topAnchor.constraint(equalTo: lbInfo.bottomAnchor, constant: 10).isActive = true
        ivVote.heightAnchor.constraint(equalToConstant: 10).isActive = true
    }
    
    private func setupLbVote() {
        lbVote.text = "6.5"
        lbVote.font = .rounded(ofSize: 14, weight: .medium)
        lbVote.textColor = .prussianBlue
        
        lbVote.translatesAutoresizingMaskIntoConstraints = false
        lbVote.leadingAnchor.constraint(equalTo: ivVote.trailingAnchor, constant: 10).isActive = true
        lbVote.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        lbVote.centerYAnchor.constraint(equalTo: ivVote.centerYAnchor).isActive = true
    }
    
}
