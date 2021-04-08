//
//  ListViewController.swift
//  Mooovie
//
//  Created by aku pintar indonesia on 08/04/21.
//

import UIKit

class ListViewController: UIViewController {
    
    private let vm = ListViewModel(service: MovieService())
    
    var cvMovie = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
    
}

// MARK: LIFECYCLE
extension ListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Mooovie"
        self.view.backgroundColor = .white
        
//
//            let layout = UICollectionViewFlowLayout()
//            layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 40, right: 20)
//        layout.scrollDirection = .vertical
//            cvMovie = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        view.addSubview(cvMovie)
        cvMovie.translatesAutoresizingMaskIntoConstraints = false
        cvMovie.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        cvMovie.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        cvMovie.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        cvMovie.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        cvMovie.backgroundColor = .green
        
        self.vm.fetchList()
    }


}

