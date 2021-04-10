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
    var lbTitle = UILabel()
    var lbTagline = UILabel()
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
    var btWebsite = UIButton()
    var ivWebsite = UIImageView()
    var lbWebsite = UILabel()
    var lbOverview = UILabel()
    
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
        setupRxMovieDetail()
        setupRxScrollNavbarTransparency()
        setupRxWebsiteTap()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.standardAppearance.backgroundColor = .clear
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.layoutIfNeeded()
        GradientUtils.addVertical(to: ivBackdrop, startColor: .clear, endColor: .white)
    }
    
}

// MARK: MEMBER
extension DetailViewController {
    
    private func setupRxMovieDetail() {
        vm.movie
            .subscribe(onNext: { [weak self] movie in
                DispatchQueue.main.async {
                    self?.ivBackdrop.from(movie?.backdrop ?? "")
                    self?.ivPoster.from(movie?.poster ?? "")
                    self?.lbTitle.text = movie?.title
                    self?.lbTagline.text = movie?.tagline
                    self?.lbVote.text = movie?.vote
                    self?.lbVoteCount.text = movie?.voteCount
                    self?.lbRuntime.text = movie?.runtime
                    self?.lbLanguage.text = " " + (movie?.language ?? "") + " "
                    self?.lbOverview.text = movie?.overview
                }
            }).disposed(by: disposeBag)
    }
    
    private func setupRxScrollNavbarTransparency() {
        scv.rx.didScroll
            .subscribe(onNext: { [weak self] in
                let offset = self?.scv.contentOffset.y ?? 0
                let alphaOffset = (self?.ivBackdrop.frame.maxY ?? 0)
                let alpha = min(offset / alphaOffset, 1)
                self?.navigationController?.navigationBar.standardAppearance.backgroundColor = UIColor.maximumRed.withAlphaComponent(alpha)
            }).disposed(by: disposeBag)
    }
    
    private func setupRxWebsiteTap() {
        btWebsite.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.btWebsite.alpha = 1
                if let string = self?.vm.movie.value?.website, let url = URL(string: string) {
                    UIApplication.shared.open(url)
                }
            }).disposed(by: disposeBag)
        btWebsite.rx.controlEvent(.touchDown)
            .subscribe(onNext: { [weak self] in
                self?.btWebsite.alpha = 0.5
            }).disposed(by: disposeBag)
    }
    
}
