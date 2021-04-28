//
//  BookmarkViewController.swift
//  Mooovie
//
//  Created by aku pintar indonesia on 28/04/21.
//

import UIKit
import RxSwift
import RxCocoa

class BookmarkViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    
    var cvBookmark = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    static func create() -> BookmarkViewController {
        let vc = BookmarkViewController()
        return vc
    }
    
}


// MARK: LIFECYCLE
extension BookmarkViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(CoreDataManager.shared.getBookmarks())
        setupUI()
        setupRxListMovie()
    }
    
}


// MARK: MEMBER
extension BookmarkViewController {
    
    private func setupRxListMovie() {
        cvBookmark.rx.setDelegate(self).disposed(by: disposeBag)
        cvBookmark.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
//                let vc = DetailViewController.create(movieId: self?.vm.movies.value[indexPath.row].id)
//                self?.navigationController?.pushViewController(vc, animated: true)
            }).disposed(by: disposeBag)
        let a = BehaviorRelay<[String]>(value: ["","","",""])
        a.bind(to: cvBookmark.rx.items(cellIdentifier: MovieCell.identifier, cellType: MovieCell.self)) { row, vm, cell in
            DispatchQueue.main.async {
//                cell.configure(vm: vm)
            }
        }.disposed(by: disposeBag)
    }
    
}

// MARK: COLLECTION VIEW
extension BookmarkViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 40, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
}
