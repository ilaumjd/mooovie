//
//  BookmarkCell.swift
//  Mooovie
//
//  Created by aku pintar indonesia on 28/04/21.
//

import UIKit

class BookmarkCell: UICollectionViewCell {
    
    static let identifier = "BookmarkCell"
    
    var ivPoster = UIImageView()
    var lbTitle = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: MEMBER
extension BookmarkCell {
    
    func configure(vm: BookmarkViewModel) {
        ivPoster.from(vm.poster)
        lbTitle.text = vm.title
    }
    
}

// MARK: UI
extension BookmarkCell {
    
    func setupUI() {
        self.addSubview(ivPoster)
        self.addSubview(lbTitle)
        
        self.setupIvPoster()
        setupLbTitle()
    }
    
    private func setupIvPoster() {
        ivPoster.contentMode = .scaleAspectFill
        ivPoster.backgroundColor = .prussianBlue
        ivPoster.layer.cornerRadius = 4
        ivPoster.layer.masksToBounds = true
        
        ivPoster.translatesAutoresizingMaskIntoConstraints = false
        ivPoster.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        ivPoster.widthAnchor.constraint(equalToConstant: 50).isActive = true
        ivPoster.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        ivPoster.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10).isActive = true
    }
    
    private func setupLbTitle() {
        lbTitle.text = "Godzilla and Kong Kong Kong Kong Kong"
        lbTitle.numberOfLines = 1
        lbTitle.font = .rounded(ofSize: 17, weight: .bold)
        lbTitle.textColor = .prussianBlue
        
        lbTitle.translatesAutoresizingMaskIntoConstraints = false
        lbTitle.leadingAnchor.constraint(equalTo: ivPoster.trailingAnchor, constant: 10).isActive = true
        lbTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        lbTitle.centerYAnchor.constraint(equalTo: ivPoster.centerYAnchor).isActive = true
    }

}
