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
            .subscribe(onNext: { category in
                print(category)
            }).disposed(by: disposeBag)
    }
    
}

extension ListViewModel {
    
    func fetchList() {
        self.service.fetchList { movies in
            if let movies = movies {
                self.movies.accept(movies.map(MovieViewModel.init))
            }
        }
    }
    
}
