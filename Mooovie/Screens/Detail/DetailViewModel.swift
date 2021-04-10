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
    
    init(service: MovieServiceProtocol) {
        self.service = service
        setupRx()
    }
    
    private func setupRx() {
        self.movieId
            .subscribe(onNext: { [weak self] movieId in
                self?.fetchDetail(movieId: movieId)
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
    
}
