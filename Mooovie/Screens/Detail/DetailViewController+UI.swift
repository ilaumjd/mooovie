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
        setupIvBackdrop()
        setupIvPoster()
        setupLbTitle()
        setupLbTagline()
        setupStvHInfo()
        setupIvVote()
        setupLbVote()
        setupLbVoteCount()
        setupIvRuntime()
        setupLbRuntime()
        setupLbMinutes()
        setupLbLanguage()
        setupIvWebsite()
        setupLbWebsite()
        setupLbInfo()
        setupLbOverview()
        setupLbTrailer()
        setupCvTrailer()
    }
    
    private func addSubviews() {
        view.addSubview(scv)
        scv.addSubview(vScvContent)
        vScvContent.addSubview(ivBackdrop)
        vScvContent.addSubview(ivPoster)
        vScvContent.addSubview(lbTitle)
        vScvContent.addSubview(lbTagline)
        vScvContent.addSubview(stvHInfo)
        stvHInfo.addArrangedSubview(vVote)
        vVote.addSubview(ivVote)
        vVote.addSubview(lbVote)
        vVote.addSubview(lbVoteCount)
        stvHInfo.addArrangedSubview(vRuntime)
        vRuntime.addSubview(ivRuntime)
        vRuntime.addSubview(lbRuntime)
        vRuntime.addSubview(lbMinutes)
        stvHInfo.addArrangedSubview(vLanguage)
        vLanguage.addSubview(lbLanguage)
        stvHInfo.addArrangedSubview(btWebsite)
        btWebsite.addSubview(ivWebsite)
        btWebsite.addSubview(lbWebsite)
        vScvContent.addSubview(lbInfo)
        vScvContent.addSubview(lbOverview)
        vScvContent.addSubview(lbTrailer)
        vScvContent.addSubview(cvTrailer)
    }
    
    private func setupSvMovie() {
        scv.frame = self.view.frame
        scv.contentSize = scvSize
        scv.autoresizingMask = .flexibleWidth
        scv.contentInsetAdjustmentBehavior = .never
        scv.bounces = false
        
        vScvContent.frame.size = scvSize
        vScvContent.backgroundColor = .clear
        
        scv.translatesAutoresizingMaskIntoConstraints = false
        scv.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scv.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scv.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scv.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func setupIvBackdrop() {
        ivBackdrop.contentMode = .scaleAspectFill
        
        ivBackdrop.translatesAutoresizingMaskIntoConstraints = false
        ivBackdrop.leadingAnchor.constraint(equalTo: vScvContent.leadingAnchor).isActive = true
        ivBackdrop.trailingAnchor.constraint(equalTo: vScvContent.trailingAnchor).isActive = true
        ivBackdrop.topAnchor.constraint(equalTo: vScvContent.topAnchor).isActive = true
        ivBackdrop.heightAnchor.constraint(equalToConstant: 260).isActive = true
    }
    
    private func setupIvPoster() {
        ivPoster.contentMode = .scaleAspectFill
        ivPoster.backgroundColor = .prussianBlue
        ivPoster.layer.cornerRadius = 10
        ivPoster.layer.masksToBounds = true

        ivPoster.translatesAutoresizingMaskIntoConstraints = false
        ivPoster.widthAnchor.constraint(equalToConstant: 140).isActive = true
        ivPoster.centerXAnchor.constraint(equalTo: vScvContent.centerXAnchor).isActive = true
        ivPoster.topAnchor.constraint(equalTo: vScvContent.safeAreaLayoutGuide.topAnchor, constant: 120).isActive = true
        ivPoster.heightAnchor.constraint(equalToConstant: 210).isActive = true
    }
    
    private func setupLbTitle() {
        lbTitle.font = .rounded(ofSize: 20, weight: .bold)
        lbTitle.textColor = .prussianBlue
        lbTitle.textAlignment = .center
        lbTitle.numberOfLines = 0
        
        lbTitle.translatesAutoresizingMaskIntoConstraints = false
        lbTitle.widthAnchor.constraint(equalTo: vScvContent.widthAnchor, constant: -40).isActive = true
        lbTitle.centerXAnchor.constraint(equalTo: vScvContent.centerXAnchor).isActive = true
        lbTitle.topAnchor.constraint(equalTo: ivPoster.bottomAnchor, constant: 20).isActive = true
    }
    
    private func setupLbTagline() {
        lbTagline.font = .italic(ofSize: 14, weight: .regular)
        lbTagline.textColor = .prussianBlue
        lbTagline.textAlignment = .center
        lbTagline.numberOfLines = 0
        
        lbTagline.translatesAutoresizingMaskIntoConstraints = false
        lbTagline.widthAnchor.constraint(equalTo: vScvContent.widthAnchor, constant: -40).isActive = true
        lbTagline.centerXAnchor.constraint(equalTo: vScvContent.centerXAnchor).isActive = true
        lbTagline.topAnchor.constraint(equalTo: lbTitle.bottomAnchor).isActive = true
    }
    
    private func setupStvHInfo() {
        stvHInfo.axis = .horizontal
        
        stvHInfo.translatesAutoresizingMaskIntoConstraints = false
        stvHInfo.leadingAnchor.constraint(equalTo: vScvContent.leadingAnchor).isActive = true
        stvHInfo.trailingAnchor.constraint(equalTo: vScvContent.trailingAnchor).isActive = true
        stvHInfo.topAnchor.constraint(equalTo: lbTagline.bottomAnchor, constant: 20).isActive = true
        stvHInfo.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        vRuntime.widthAnchor.constraint(equalTo: vVote.widthAnchor, multiplier: 1).isActive = true
        vLanguage.widthAnchor.constraint(equalTo: vVote.widthAnchor, multiplier: 1).isActive = true
        btWebsite.widthAnchor.constraint(equalTo: vVote.widthAnchor, multiplier: 1).isActive = true
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
        lbVote.font = .rounded(ofSize: 20, weight: .bold)
        lbVote.textColor = .prussianBlue
        
        lbVote.translatesAutoresizingMaskIntoConstraints = false
        lbVote.centerXAnchor.constraint(equalTo: vVote.centerXAnchor).isActive = true
        lbVote.centerYAnchor.constraint(equalTo: vVote.centerYAnchor).isActive = true
        lbVote.topAnchor.constraint(equalTo: ivVote.bottomAnchor, constant: 0).isActive = true
    }
    
    private func setupLbVoteCount() {
        lbVoteCount.font = .rounded(ofSize: 10, weight: .regular)
        lbVoteCount.textColor = .prussianBlue
        
        lbVoteCount.translatesAutoresizingMaskIntoConstraints = false
        lbVoteCount.translatesAutoresizingMaskIntoConstraints = false
        lbVoteCount.centerXAnchor.constraint(equalTo: vVote.centerXAnchor).isActive = true
        lbVoteCount.topAnchor.constraint(equalTo: lbVote.bottomAnchor, constant: 0).isActive = true
    }
    
    private func setupIvRuntime() {
        ivRuntime.image = UIImage(systemName: "clock")
        ivRuntime.tintColor = .prussianBlue
        
        ivRuntime.translatesAutoresizingMaskIntoConstraints = false
        ivRuntime.centerXAnchor.constraint(equalTo: vRuntime.centerXAnchor).isActive = true
        ivRuntime.widthAnchor.constraint(equalToConstant: 20).isActive = true
        ivRuntime.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    private func setupLbRuntime() {
        lbRuntime.font = .rounded(ofSize: 20, weight: .bold)
        lbRuntime.textColor = .prussianBlue
        
        lbRuntime.translatesAutoresizingMaskIntoConstraints = false
        lbRuntime.centerXAnchor.constraint(equalTo: vRuntime.centerXAnchor).isActive = true
        lbRuntime.centerYAnchor.constraint(equalTo: vRuntime.centerYAnchor).isActive = true
        lbRuntime.topAnchor.constraint(equalTo: ivRuntime.bottomAnchor, constant: 0).isActive = true
    }
    
    private func setupLbMinutes() {
        lbMinutes.text = "minutes"
        lbMinutes.font = .rounded(ofSize: 10, weight: .regular)
        lbMinutes.textColor = .prussianBlue
        
        lbMinutes.translatesAutoresizingMaskIntoConstraints = false
        lbMinutes.translatesAutoresizingMaskIntoConstraints = false
        lbMinutes.centerXAnchor.constraint(equalTo: vRuntime.centerXAnchor).isActive = true
        lbMinutes.topAnchor.constraint(equalTo: lbRuntime.bottomAnchor, constant: 0).isActive = true
    }
    
    private func setupLbLanguage() {
        lbLanguage.font = .rounded(ofSize: 20, weight: .bold)
        lbLanguage.textColor = .prussianBlue
        lbLanguage.layer.borderWidth = 2
        lbLanguage.layer.borderColor = UIColor.prussianBlue.cgColor
        
        lbLanguage.translatesAutoresizingMaskIntoConstraints = false
        lbLanguage.centerXAnchor.constraint(equalTo: vLanguage.centerXAnchor).isActive = true
        lbLanguage.centerYAnchor.constraint(equalTo: vLanguage.centerYAnchor).isActive = true
    }
    
    private func setupIvWebsite() {
        ivWebsite.image = UIImage(systemName: "globe")
        
        ivWebsite.translatesAutoresizingMaskIntoConstraints = false
        ivWebsite.centerXAnchor.constraint(equalTo: btWebsite.centerXAnchor).isActive = true
        ivWebsite.centerYAnchor.constraint(equalTo: btWebsite.centerYAnchor, constant: -10).isActive = true
        ivWebsite.widthAnchor.constraint(equalToConstant: 24).isActive = true
        ivWebsite.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
    
    private func setupLbWebsite() {
        lbWebsite.text = "Visit\nwebsite"
        lbWebsite.textAlignment = .center
        lbWebsite.textColor = .systemBlue
        lbWebsite.numberOfLines = 2
        lbWebsite.font = .rounded(ofSize: 10, weight: .regular)
        
        lbWebsite.translatesAutoresizingMaskIntoConstraints = false
        lbWebsite.centerXAnchor.constraint(equalTo: btWebsite.centerXAnchor).isActive = true
        lbWebsite.topAnchor.constraint(equalTo: ivWebsite.bottomAnchor).isActive = true
    }
    
    private func setupLbInfo() {
        lbInfo.font = .rounded(ofSize: 12, weight: .regular)
        lbInfo.textColor = .prussianBlue
        lbInfo.numberOfLines = 0
        
        lbInfo.translatesAutoresizingMaskIntoConstraints = false
        lbInfo.leadingAnchor.constraint(equalTo: vScvContent.leadingAnchor, constant: 20).isActive = true
        lbInfo.trailingAnchor.constraint(equalTo: vScvContent.trailingAnchor, constant: -20).isActive = true
        lbInfo.topAnchor.constraint(equalTo: stvHInfo.bottomAnchor, constant: 20).isActive = true
    }
    
    private func setupLbOverview() {
        lbOverview.font = .rounded(ofSize: 12, weight: .regular)
        lbOverview.textColor = .prussianBlue
        lbOverview.numberOfLines = 0
        
        lbOverview.translatesAutoresizingMaskIntoConstraints = false
        lbOverview.leadingAnchor.constraint(equalTo: vScvContent.leadingAnchor, constant: 20).isActive = true
        lbOverview.trailingAnchor.constraint(equalTo: vScvContent.trailingAnchor, constant: -20).isActive = true
        lbOverview.topAnchor.constraint(equalTo: lbInfo.bottomAnchor, constant: 10).isActive = true
    }
    
    private func setupLbTrailer() {
        lbTrailer.text = "Trailers"
        lbTrailer.font = .rounded(ofSize: 16, weight: .bold)
        lbTrailer.textColor = .prussianBlue
        
        lbTrailer.translatesAutoresizingMaskIntoConstraints = false
        lbTrailer.leadingAnchor.constraint(equalTo: vScvContent.leadingAnchor, constant: 20).isActive = true
        lbTrailer.trailingAnchor.constraint(equalTo: vScvContent.trailingAnchor, constant: -20).isActive = true
        lbTrailer.topAnchor.constraint(equalTo: lbOverview.bottomAnchor, constant: 20).isActive = true
    }
    
    private func setupCvTrailer() {
        cvTrailer.backgroundColor = .green
        cvTrailer.showsVerticalScrollIndicator = false
        cvTrailer.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.identifier)
        
        cvTrailer.translatesAutoresizingMaskIntoConstraints = false
        cvTrailer.leadingAnchor.constraint(equalTo: vScvContent.leadingAnchor).isActive = true
        cvTrailer.trailingAnchor.constraint(equalTo: vScvContent.trailingAnchor).isActive = true
        cvTrailer.topAnchor.constraint(equalTo: lbTrailer.bottomAnchor, constant: 10).isActive = true
        cvTrailer.heightAnchor.constraint(equalToConstant: 160).isActive = true
    }

    
}
