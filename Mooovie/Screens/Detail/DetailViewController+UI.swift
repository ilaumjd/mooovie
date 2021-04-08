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
        view.addSubview(svMovie)
        svMovie.addSubview(vSvMovieContent)
        vSvMovieContent.addSubview(ivPoster)
        
        setupSvMovie()
        setupIvPoster()
    }
    
    private func setupSvMovie() {
        svMovie.frame = self.view.frame
        svMovie.contentSize = svSize
        svMovie.autoresizingMask = .flexibleWidth
        svMovie.contentInsetAdjustmentBehavior = .never
        
        vSvMovieContent.frame.size = svSize
        vSvMovieContent.backgroundColor = .gray
        
        svMovie.translatesAutoresizingMaskIntoConstraints = false
        svMovie.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        svMovie.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        svMovie.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        svMovie.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func setupIvPoster() {
        ivPoster.backgroundColor = .orange

        ivPoster.translatesAutoresizingMaskIntoConstraints = false
        ivPoster.widthAnchor.constraint(equalToConstant: 200).isActive = true
        ivPoster.centerXAnchor.constraint(equalTo: vSvMovieContent.centerXAnchor).isActive = true
        ivPoster.topAnchor.constraint(equalTo: vSvMovieContent.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        ivPoster.heightAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
}
