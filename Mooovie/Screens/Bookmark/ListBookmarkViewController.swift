//
//  ListBookmarkViewController.swift
//  Mooovie
//
//  Created by aku pintar indonesia on 28/04/21.
//

import UIKit
import RxSwift
import RxCocoa

class ListBookmarkViewController: UIViewController {
    
    private let vm = ListBookmarkViewModel()
    private let disposeBag = DisposeBag()
    
    var cvBookmark = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    static func create() -> ListBookmarkViewController {
        let vc = ListBookmarkViewController()
        return vc
    }
    
}


// MARK: LIFECYCLE
extension ListBookmarkViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupRxListMovie()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        vm.fetchBookmarks()
    }

}


// MARK: MEMBER
extension ListBookmarkViewController {
    
    private func setupRxListMovie() {
        cvBookmark.rx.setDelegate(self).disposed(by: disposeBag)
        cvBookmark.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                let vc = DetailViewController.create(movieId: self?.vm.bookmarks.value[indexPath.row].id)
                self?.navigationController?.pushViewController(vc, animated: true)
            }).disposed(by: disposeBag)
        vm.bookmarks.bind(to: cvBookmark.rx.items(cellIdentifier: BookmarkCell.identifier, cellType: BookmarkCell.self)) { row, vm, cell in
            DispatchQueue.main.async {
                cell.configure(vm: vm)
            }
        }.disposed(by: disposeBag)
    }
    
}

// MARK: COLLECTION VIEW
extension ListBookmarkViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 40, height: 70)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
}
