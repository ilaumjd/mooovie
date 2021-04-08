//
//  DetailViewController.swift
//  Mooovie
//
//  Created by aku pintar indonesia on 08/04/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    private let vm = DetailViewModel(service: MovieService())
    
    static func create(movieId: Int?) -> DetailViewController {
        let vc = DetailViewController()
        vc.vm.movieId = movieId
        return vc
    }
    
}

// MARK: LIFECYCLE
extension DetailViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        vm.fetchDetail()
    }
    
}
