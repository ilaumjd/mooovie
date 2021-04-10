//
//  ListViewController.swift
//  Mooovie
//
//  Created by aku pintar indonesia on 08/04/21.
//

import UIKit
import RxSwift
import RxCocoa

class ListViewController: UIViewController {
    
    private let vm = ListViewModel(service: MovieService())
    private let disposeBag = DisposeBag()
    
    var cvMovie = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
    
}

// MARK: LIFECYCLE
extension ListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupRxListMovie()
        
        self.vm.fetchList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.sizeToFit()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
    }

}

// MARK: MEMBER
extension ListViewController {
    
    private func setupRxListMovie() {
        cvMovie.rx.setDelegate(self).disposed(by: disposeBag)
        cvMovie.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                let vc = DetailViewController.create(movieId: self?.vm.movies.value[indexPath.row].id)
                self?.navigationController?.pushViewController(vc, animated: true)
            }).disposed(by: disposeBag)
        vm.movies.bind(to: cvMovie.rx.items(cellIdentifier: MovieCell.identifier, cellType: MovieCell.self)) { row, vm, cell in
            cell.configure(vm: vm)
        }.disposed(by: disposeBag)
    }
    
}

// MARK: COLLECTION VIEW
extension ListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
}
