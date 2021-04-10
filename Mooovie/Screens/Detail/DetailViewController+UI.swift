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
        
        addSubviews()
        
        setupSvMovie()
        setupIvPoster()
        setupStvHInfo()
        setupIvVote()
        setupLbVote()
        setupLbVoteCount()
        setupLbRuntime()
        setupLbLanguage()
    }
    
    private func addSubviews() {
        view.addSubview(scv)
        scv.addSubview(vScvContent)
        vScvContent.addSubview(ivPoster)
        vScvContent.addSubview(stvHInfo)
        stvHInfo.addArrangedSubview(vVote)
        vVote.addSubview(ivVote)
        vVote.addSubview(lbVote)
        vVote.addSubview(lbVoteCount)
        stvHInfo.addArrangedSubview(vRuntime)
        vRuntime.addSubview(lbRuntime)
        stvHInfo.addArrangedSubview(vLanguage)
        vLanguage.addSubview(lbLanguage)
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
        stvHInfo.axis = .horizontal
//        stvHInfo.alignment = .center
        
        stvHInfo.translatesAutoresizingMaskIntoConstraints = false
        stvHInfo.leadingAnchor.constraint(equalTo: vScvContent.leadingAnchor).isActive = true
        stvHInfo.trailingAnchor.constraint(equalTo: vScvContent.trailingAnchor).isActive = true
        stvHInfo.topAnchor.constraint(equalTo: ivPoster.bottomAnchor, constant: 20).isActive = true
        stvHInfo.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        vRuntime.widthAnchor.constraint(equalTo: vVote.widthAnchor, multiplier: 1).isActive = true
        vLanguage.widthAnchor.constraint(equalTo: vVote.widthAnchor, multiplier: 1).isActive = true
    }
    
    private func setupIvVote() {
        ivVote.image = UIImage(systemName: "star.fill")
        ivVote.tintColor = .maximumYellow
        
        ivVote.translatesAutoresizingMaskIntoConstraints = false
        ivVote.centerXAnchor.constraint(equalTo: vVote.centerXAnchor).isActive = true
        ivVote.widthAnchor.constraint(equalToConstant: 20).isActive = true
        ivVote.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    private func setupLbVote() {
        lbVote.text = "6.5"
        lbVote.font = .rounded(ofSize: 20, weight: .bold)
        lbVote.textColor = .prussianBlue
        
        lbVote.translatesAutoresizingMaskIntoConstraints = false
        lbVote.centerXAnchor.constraint(equalTo: vVote.centerXAnchor).isActive = true
        lbVote.centerYAnchor.constraint(equalTo: vVote.centerYAnchor).isActive = true
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
        lbRuntime.text = "6.5"
        lbRuntime.font = .rounded(ofSize: 20, weight: .bold)
        lbRuntime.textColor = .prussianBlue
        
        lbRuntime.translatesAutoresizingMaskIntoConstraints = false
        lbRuntime.centerXAnchor.constraint(equalTo: vRuntime.centerXAnchor).isActive = true
        lbRuntime.centerYAnchor.constraint(equalTo: vRuntime.centerYAnchor).isActive = true
    }
    
    private func setupLbLanguage() {
        lbLanguage.backgroundColor = .blue
        lbLanguage.text = "6.5"
        lbLanguage.font = .rounded(ofSize: 20, weight: .bold)
        lbLanguage.textColor = .prussianBlue
        
        lbLanguage.translatesAutoresizingMaskIntoConstraints = false
        lbLanguage.centerXAnchor.constraint(equalTo: vLanguage.centerXAnchor).isActive = true
        lbLanguage.centerYAnchor.constraint(equalTo: vLanguage.centerYAnchor).isActive = true
    }

    
}
