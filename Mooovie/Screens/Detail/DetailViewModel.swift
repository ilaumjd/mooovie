//
//  DetailViewModel.swift
//  Mooovie
//
//  Created by aku pintar indonesia on 08/04/21.
//

import RxSwift

class DetailViewModel {
    
    private let service: MovieServiceProtocol
    
    private let disposeBag = DisposeBag()
    
    let movieId = PublishSubject<Int>()
    let movie = PublishSubject<MovieViewModel>()
    
    init(service: MovieServiceProtocol) {
        self.service = service
        setupRx()
    }
    
    func setupRx() {
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
                self.movie.onNext(MovieViewModel(model: movie))
            }
        }
    }
    
}
