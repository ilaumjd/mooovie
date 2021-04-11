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
    var lbInfo = UILabel()
    var lbOverview = UILabel()
    var lbTrailer = UILabel()
    var cvTrailer = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
    
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
        setupRxTrailerList()
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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.standardAppearance.backgroundColor = .maximumRed
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
                    self?.lbInfo.text = "Release date: \(movie?.releaseDate ?? "")\n"
                        + "Genres: \(movie?.genres ?? "")"
                        
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
                DispatchQueue.main.async {
                    self?.btWebsite.alpha = 1
                    if let string = self?.vm.movie.value?.website, let url = URL(string: string) {
                        UIApplication.shared.open(url)
                    }
                }
            }).disposed(by: disposeBag)
        btWebsite.rx.controlEvent(.touchDown)
            .subscribe(onNext: { [weak self] in
                DispatchQueue.main.async {
                    self?.btWebsite.alpha = 0.5
                }
            }).disposed(by: disposeBag)
    }
    
    private func setupRxTrailerList() {
        cvTrailer.register(TrailerCell.self, forCellWithReuseIdentifier: TrailerCell.identifier)
        cvTrailer.rx.setDelegate(self).disposed(by: disposeBag)
        vm.trailerList
            .bind(to: cvTrailer.rx.items(cellIdentifier: TrailerCell.identifier, cellType: TrailerCell.self)) { row, vm, cell in
                DispatchQueue.main.async {
                    cell.configure(vm: vm)
                }
            }.disposed(by: disposeBag)
    }
    
}

// MARK: COLLECTION VIEW
extension DetailViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 280, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 40
    }
    
}
