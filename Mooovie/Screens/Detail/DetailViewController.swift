//
//  DetailViewController.swift
//  Mooovie
//
//  Created by aku pintar indonesia on 08/04/21.
//

import UIKit
import RxSwift

class DetailViewController: UIViewController {
    
    private let vm = DetailViewModel(service: MovieService())
    private let disposeBag = DisposeBag()
    
    var scvSize = CGSize(width: UIScreen.main.bounds.width, height: 2000)
    
    var scv = UIScrollView()
    var vScvContent = UIView()
    var ivBackdrop = UIImageView()
    var ivPoster = UIImageView()
    var stvHInfo = UIStackView()
    var vVote = UIView()
    var ivVote = UIImageView()
    var lbVote = UILabel()
    var lbVoteCount = UILabel()
    var vRuntime = UIView()
    var ivRuntime = UIImageView()
    var lbRuntime = UILabel()
    var lbMinutes = UILabel()
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
        setupRx()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.standardAppearance.backgroundColor = .clear
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.layoutIfNeeded()
        GradientUtils.addVertical(to: ivBackdrop, startColor: .clear, endColor: .white)
    }
    
}

// MARK: MEMBER
extension DetailViewController {
    
    private func setupRx() {
        vm.movie
            .subscribe(onNext: { [weak self] movie in
                DispatchQueue.main.async {
                    self?.ivPoster.from(movie.poster)
                    self?.ivBackdrop.from(movie.backdrop)
                    self?.lbVote.text = movie.vote
                    self?.lbVoteCount.text = movie.voteCount
                    self?.lbRuntime.text = movie.runtime
                    self?.lbLanguage.text = " " + movie.language + " "
                }
            }).disposed(by: disposeBag)
    }
    
}
