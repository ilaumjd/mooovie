//
//  DetailViewModel.swift
//  Mooovie
//
//  Created by aku pintar indonesia on 08/04/21.
//

import RxSwift
import RxCocoa

class DetailViewModel {
    
    private let service: MovieServiceProtocol
    
    private let disposeBag = DisposeBag()
    
    let movieId = PublishSubject<Int>()
    let movie = BehaviorRelay<MovieViewModel?>(value: nil)
    let trailerList = BehaviorRelay<[TrailerViewModel]>(value: [])
    let isBookmarked = BehaviorRelay<Bool>(value: false)
    
    init(service: MovieServiceProtocol) {
        self.service = service
        setupRx()
    }
    
    private func setupRx() {
        self.movieId
            .subscribe(onNext: { [weak self] movieId in
                self?.fetchDetail(movieId: movieId)
                self?.fetchTrailers(movieId: movieId)
                self?.checkBookmarked(movieId: movieId)
            }).disposed(by: disposeBag)
    }
    
}

extension DetailViewModel {
    
    private func fetchDetail(movieId: Int) {
        service.fetchMovieDetail(movieId: movieId) { movie in
            if let movie = movie {
                self.movie.accept(MovieViewModel(model: movie))
            }
        }
    }
    
    private func fetchTrailers(movieId: Int) {
        service.fetchTrailers(movieId: movieId) { trailerList in
            if let trailerList = trailerList {
                self.trailerList.accept(trailerList
                                            .filter { ($0.site ?? "") == "YouTube" }
                                            .map(TrailerViewModel.init))
            }
        }
    }
    
    
    private func checkBookmarked(movieId: Int) {
        let isBookmarked = CoreDataManager.shared.isBookmarked(id: movieId)
        self.isBookmarked.accept(isBookmarked)
    }
    
    func bookmark() {
        if let movie = self.movie.value {
            if !self.isBookmarked.value {
                CoreDataManager.shared.addBookmark(id: movie.id, title: movie.title, poster: movie.poster)
            } else {
                CoreDataManager.shared.deleteBookmark(id: movie.id)
            }
            self.checkBookmarked(movieId: movie.id)
        }
    }
    
}
