//
//  DetailViewController+UI.swift
//  Mooovie
//
//  Created by aku pintar indonesia on 08/04/21.
//

import UIKit

extension DetailViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    func setupUI() {
        view.backgroundColor = .pureWhite
        
        view.addSubview(scv)
        scv.addSubview(vScvContent)
        vScvContent.addSubview(ivPoster)
        vScvContent.addSubview(stvHInfo)
        stvHInfo.addArrangedSubview(vVote)
        vVote.addSubview(ivVote)
        vVote.addSubview(lbVote)
        vVote.addSubview(lbVoteCount)
        stvHInfo.addArrangedSubview(lbRuntime)
        stvHInfo.addArrangedSubview(lbLanguage)
        
        setupSvMovie()
        setupIvPoster()
        setupStvHInfo()
        setupVVote()
        setupIvVote()
        setupLbVote()
        setupLbVoteCount()
        setupLbRuntime()
        setupLbLanguage()
    }
    
    private func setupSvMovie() {
        scv.frame = self.view.frame
        scv.contentSize = scvSize
        scv.autoresizingMask = .flexibleWidth
        scv.contentInsetAdjustmentBehavior = .never
        
        vScvContent.frame.size = scvSize
        vScvContent.backgroundColor = .clear
        
        scv.translatesAutoresizingMaskIntoConstraints = false
        scv.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scv.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scv.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scv.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func setupIvPoster() {
        ivPoster.backgroundColor = .orange

        ivPoster.translatesAutoresizingMaskIntoConstraints = false
        ivPoster.widthAnchor.constraint(equalToConstant: 200).isActive = true
        ivPoster.centerXAnchor.constraint(equalTo: vScvContent.centerXAnchor).isActive = true
        ivPoster.topAnchor.constraint(equalTo: vScvContent.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        ivPoster.heightAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
    private func setupStvHInfo() {
        stvHInfo.distribution = .fillEqually
        
        stvHInfo.translatesAutoresizingMaskIntoConstraints = false
        stvHInfo.leadingAnchor.constraint(equalTo: vScvContent.leadingAnchor).isActive = true
        stvHInfo.trailingAnchor.constraint(equalTo: vScvContent.trailingAnchor).isActive = true
        stvHInfo.topAnchor.constraint(equalTo: ivPoster.bottomAnchor, constant: 20).isActive = true
        stvHInfo.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    private func setupVVote() {
        vVote.backgroundColor = .red
        
    }
    
    private func setupIvVote() {
        ivVote.image = UIImage(systemName: "star.fill")
        ivVote.tintColor = .maximumYellow
        
        ivVote.translatesAutoresizingMaskIntoConstraints = false
        ivVote.centerXAnchor.constraint(equalTo: vVote.centerXAnchor).isActive = true
        ivVote.widthAnchor.constraint(equalToConstant: 20).isActive = true
        ivVote.topAnchor.constraint(equalTo: vVote.topAnchor, constant: 12).isActive = true
        ivVote.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    private func setupLbVote() {
        lbVote.text = "6.5"
        lbVote.font = .rounded(ofSize: 20, weight: .bold)
        lbVote.textColor = .prussianBlue
        
        lbVote.translatesAutoresizingMaskIntoConstraints = false
        lbVote.translatesAutoresizingMaskIntoConstraints = false
        lbVote.centerXAnchor.constraint(equalTo: vVote.centerXAnchor).isActive = true
        lbVote.topAnchor.constraint(equalTo: ivVote.bottomAnchor, constant: 0).isActive = true
    }
    
    private func setupLbVoteCount() {
        lbVoteCount.text = "3917 votes"
        lbVoteCount.font = .rounded(ofSize: 10, weight: .regular)
        lbVoteCount.textColor = .prussianBlue
        
        lbVoteCount.translatesAutoresizingMaskIntoConstraints = false
        lbVoteCount.translatesAutoresizingMaskIntoConstraints = false
        lbVoteCount.centerXAnchor.constraint(equalTo: vVote.centerXAnchor).isActive = true
        lbVoteCount.topAnchor.constraint(equalTo: lbVote.bottomAnchor, constant: 0).isActive = true
    }
    
    private func setupLbRuntime() {
        lbRuntime.backgroundColor = .green
    }
    
    private func setupLbLanguage() {
        lbLanguage.backgroundColor = .blue
    }

    
}
