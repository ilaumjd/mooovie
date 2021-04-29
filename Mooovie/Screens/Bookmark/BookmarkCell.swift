//
//  BookmarkCell.swift
//  Mooovie
//
//  Created by aku pintar indonesia on 28/04/21.
//

import UIKit
import RxSwift
import RxCocoa

class BookmarkCell: UICollectionViewCell {
    
    static let identifier = "BookmarkCell"
    
    private let disposeBag = DisposeBag()
    
    var ivPoster = UIImageView()
    var lbTitle = UILabel()
    var btDelete = UIButton()
    
    var vm: BookmarkViewModel?
    var didDeleteSuccess: (() -> ())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupRxDelete()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: MEMBER
extension BookmarkCell {
    
    func configure(vm: BookmarkViewModel) {
        self.vm = vm
        ivPoster.from(vm.poster)
        lbTitle.text = vm.title
    }
    
    func setupRxDelete() {
        btDelete.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.vm?.delete {
                    self?.didDeleteSuccess?()
                }
            }).disposed(by: disposeBag)
    }
    
}

// MARK: UI
extension BookmarkCell {
    
    func setupUI() {
        self.addSubview(ivPoster)
        self.addSubview(lbTitle)
        self.addSubview(btDelete)
        
        setupIvPoster()
        setupLbTitle()
        setupBtDelete()
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
        lbTitle.numberOfLines = 2
        lbTitle.font = .rounded(ofSize: 17, weight: .bold)
        lbTitle.textColor = .prussianBlue
        
        lbTitle.translatesAutoresizingMaskIntoConstraints = false
        lbTitle.leadingAnchor.constraint(equalTo: ivPoster.trailingAnchor, constant: 10).isActive = true
        lbTitle.trailingAnchor.constraint(equalTo: btDelete.leadingAnchor, constant: -10).isActive = true
        lbTitle.centerYAnchor.constraint(equalTo: ivPoster.centerYAnchor).isActive = true
    }
    
    private func setupBtDelete() {
        btDelete.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        btDelete.tintColor = .maximumRed
        
        btDelete.translatesAutoresizingMaskIntoConstraints = false
        btDelete.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        btDelete.widthAnchor.constraint(equalTo: btDelete.heightAnchor).isActive = true
        btDelete.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8).isActive = true
        btDelete.centerYAnchor.constraint(equalTo: lbTitle.centerYAnchor).isActive = true
    }

}
