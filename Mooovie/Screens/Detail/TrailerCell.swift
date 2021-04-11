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
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
