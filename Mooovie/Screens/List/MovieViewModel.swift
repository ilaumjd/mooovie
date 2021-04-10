//
//  MovieViewModel.swift
//  Mooovie
//
//  Created by aku pintar indonesia on 08/04/21.
//

import Foundation

struct MovieViewModel {
    var model: Movie
}

extension MovieViewModel {
    
    var id: Int {
        model.id ?? 0
    }
    
    var title: String {
        model.title ?? ""
    }
    
    var releaseDate: String {
        model.releaseDate ?? ""
    }
    
    var poster: String {
        Constants.API.baseImageURL + (model.posterPath ?? "")
    }
    
    var backdropURL: String {
        ""
    }
    
    var vote: String {
        "\(model.voteAverage ?? 0)"
    }
    
    var voteCount: String {
        ""
    }
    
    var duration: String {
        ""
    }
    
    var language: String {
        ""
    }
    
}
