//
//  MovieServiceProtocol.swift
//  Mooovie
//
//  Created by aku pintar indonesia on 08/04/21.
//

import Foundation

protocol MovieServiceProtocol {
    func fetchList(completion: @escaping (([Movie]?) -> ()))
    func fetchMovieDetail(movieId: Int, completion: @escaping ((Movie?) -> ()))
    func fetchTrailers(movieId: Int, completion: @escaping (([Trailer]?) -> ()))
}
