//
//  TrailerCell.swift
//  Mooovie
//
//  Created by aku pintar indonesia on 11/04/21.
//

import UIKit
import youtube_ios_player_helper

class TrailerCell: UICollectionViewCell {
    
    static let identifier = "TrailerCell"
    
    var ytTrailer = YTPlayerView()
    var lbTrailer = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// UI
extension TrailerCell {
    
    func setupUI() {
        self.addSubview(ytTrailer)
        self.addSubview(lbTrailer)
        
        setupYtTrailer()
        setupLbTrailer()
    }
    
    func setupYtTrailer() {
        ytTrailer.layer.cornerRadius = 6
        ytTrailer.layer.masksToBounds = true
        ytTrailer.clipsToBounds = true
        
        ytTrailer.translatesAutoresizingMaskIntoConstraints = false
        ytTrailer.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        ytTrailer.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        ytTrailer.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }
    
    func setupLbTrailer() {
        lbTrailer.font = .rounded(ofSize: 12, weight: .semibold)
        lbTrailer.textColor = .prussianBlue
        
        lbTrailer.translatesAutoresizingMaskIntoConstraints = false
        lbTrailer.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        lbTrailer.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        lbTrailer.topAnchor.constraint(equalTo: ytTrailer.bottomAnchor, constant: 5).isActive = true
        lbTrailer.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
}

// MEMBER
extension TrailerCell {
    
    func configure(vm: TrailerViewModel) {
        ytTrailer.load(withVideoId: vm.key)
        lbTrailer.text = vm.name
    }
    
}
