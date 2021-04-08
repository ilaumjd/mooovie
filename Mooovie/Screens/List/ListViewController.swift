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
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Mooovie"
        self.view.backgroundColor = .white
        
        cvMovie.backgroundColor = .clear
        cvMovie.showsVerticalScrollIndicator = false
        cvMovie.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.identifier)
        
        view.addSubview(cvMovie)
        cvMovie.translatesAutoresizingMaskIntoConstraints = false
        cvMovie.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        cvMovie.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        cvMovie.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        cvMovie.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        cvMovie.rx.setDelegate(self).disposed(by: disposeBag)
        let listMovie = BehaviorRelay<[String]>(value: ["","","","","","",""])
        listMovie.bind(to: cvMovie.rx.items(cellIdentifier: MovieCell.identifier, cellType: MovieCell.self)) { row, vm, cell in
            
        }.disposed(by: disposeBag)
        
        self.vm.fetchList()
    }


}

// MARK: COLLECTION VIEW
extension ListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 150)
    }
    
}
