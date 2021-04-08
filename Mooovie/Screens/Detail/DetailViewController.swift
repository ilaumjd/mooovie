//
//  DetailViewController.swift
//  Mooovie
//
//  Created by aku pintar indonesia on 08/04/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    private let vm = DetailViewModel(service: MovieService())
    
    var svSize = CGSize(width: UIScreen.main.bounds.width, height: 2000)
    
    var svMovie = UIScrollView()
    var vSvMovieContent = UIView()
    var ivPoster = UIImageView()
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
}
