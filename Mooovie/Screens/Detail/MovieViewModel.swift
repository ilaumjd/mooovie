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
    
    var tagline: String {
        model.tagline ?? ""
    }
    
    var releaseDate: String {
        model.releaseDate ?? ""
    }
    
    var poster: String {
        Constants.API.baseImageURL + (model.posterPath ?? "")
    }
    
    var backdrop: String {
        Constants.API.baseImageURL + (model.backdropPath ?? "")
    }
    
    var vote: String {
        "\(model.voteAverage ?? 0)"
    }
    
    var voteCount: String {
        "\(model.voteCount ?? 0) votes"
    }
    
    var runtime: String {
        "\(model.runtime ?? 0)"
    }
    
    var language: String {
        if let languages = model.spokenLanguages {
            return (languages.last?.iso639_1 ?? "").uppercased()
        }
        return ""
    }
    
    var overview: String {
        model.overview ?? ""
    }
    
}
