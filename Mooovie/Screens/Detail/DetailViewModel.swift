//
//  DetailViewModel.swift
//  Mooovie
//
//  Created by aku pintar indonesia on 08/04/21.
//

import Foundation

class DetailViewModel {
    
    private let service: MovieServiceProtocol
    
    var movieId: Int?
    
    init(service: MovieServiceProtocol) {
        self.service = service
    }
    
}

extension DetailViewModel {
    
    func fetchDetail() {
        service.fetchMovieDetail(movieId: movieId ?? 0) { movie in 
            
        }
    }
    
}
