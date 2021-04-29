//
//  MockMovieService.swift
//  MooovieTests
//
//  Created by aku pintar indonesia on 29/04/21.
//

import Foundation
@testable import Mooovie

class MockMovieService: MovieServiceProtocol {
    
    func fetchList(category: String, completion: @escaping (([Movie]?) -> ())) {
        
    }
    
    func fetchMovieDetail(movieId: Int, completion: @escaping ((Movie?) -> ())) {
        let result = ""
        let jsonData = result.data(using: .utf8)!
        let movie = try? JSONDecoder().decode(Movie.self, from: jsonData)
        completion(movie)
    }
    
    func fetchTrailers(movieId: Int, completion: @escaping (([Trailer]?) -> ())) {
        
    }
    
    
}
