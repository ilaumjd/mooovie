//
//  DetailViewController.swift
//  Mooovie
//
//  Created by aku pintar indonesia on 08/04/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    private let vm = DetailViewModel(service: MovieService())
    
    var scvSize = CGSize(width: UIScreen.main.bounds.width, height: 2000)
    
    var scv = UIScrollView()
    var vScvContent = UIView()
    var ivPoster = UIImageView()
    var stvHInfo = UIStackView()
    var vVote = UIView()
    var ivVote = UIImageView()
    var lbVote = UILabel()
    var lbVoteCount = UILabel()
    var vRuntime = UIView()
    var lbRuntime = UILabel()
    var vLanguage = UIView()
    var lbLanguage = UILabel()
    
    static func create(movieId: Int?) -> DetailViewController {
        let vc = DetailViewController()
        vc.vm.movieId.onNext(movieId ?? 0)
        return vc
    }
    
}

// MARK: LIFECYCLE
extension DetailViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
}
