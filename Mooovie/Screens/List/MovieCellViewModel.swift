//
//  MovieCellViewModel.swift
//  Mooovie
//
//  Created by aku pintar indonesia on 08/04/21.
//

import Foundation

struct MovieCellViewModel {
    var model: Movie
}

extension MovieCellViewModel {
    
    var title: String {
        model.title ?? ""
    }
    
    var releaseDate: String {
        model.releaseDate ?? ""
    }
    
    var poster: String {
        Constants.API.baseImageURL + (model.posterPath ?? "")
    }
    
    var vote: String {
        "\(model.voteAverage ?? 0)"
    }
    
}
