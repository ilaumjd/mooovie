//
//  ListViewModel.swift
//  Mooovie
//
//  Created by aku pintar indonesia on 08/04/21.
//

import Foundation
import RxSwift
import RxCocoa

class ListViewModel {
    
    private let service: MovieServiceProtocol
    private let disposeBag = DisposeBag()
    
    let category = BehaviorRelay<Category>(value: Category.nowPlaying)
    let movies = BehaviorRelay<[MovieViewModel]>(value: [])
    
    init(service: MovieServiceProtocol) {
        self.service = service
        setupRx()
    }
    
    func setupRx() {
        category
            .subscribe(onNext: { [weak self] category in
                self?.fetchList(category: category.key)
            }).disposed(by: disposeBag)
    }
    
}

extension ListViewModel {
    
    func fetchList(category: String) {
        self.service.fetchList(category: category) { movies in
            if let movies = movies {
                self.movies.accept(movies.map(MovieViewModel.init))
            }
        }
    }
    
}
