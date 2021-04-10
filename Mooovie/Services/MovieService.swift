//
//  MovieService.swift
//  Mooovie
//
//  Created by aku pintar indonesia on 08/04/21.
//

import Alamofire

class MovieService: MovieServiceProtocol {
    
    func fetchList(completion: @escaping (([Movie]?) -> ())) {
        AF.request("\(Constants.API.baseURL)/movie/now_playing?api_key=\(Constants.API.key)&language=en-US&page=1").responseDecodable(of: MovieList.self) { response in
            debugPrint(response)
            switch response.result {
            case .success(let movieList):
                completion(movieList.results)
            case .failure( _):
                completion(nil)
            }
        }
    }
    
    func fetchMovieDetail(movieId: Int, completion: @escaping ((Movie?) -> ())) {
        AF.request("\(Constants.API.baseURL)/movie/\(movieId)?api_key=\(Constants.API.key)&language=en-US&page=1").responseDecodable(of: Movie.self) { response in
            debugPrint(response)
            switch response.result {
            case .success(let movie):
                completion(movie)
            case .failure( _):
                completion(nil)
            }
        }
    }
    
    func fetchTrailers(movieId: Int, completion: @escaping (([Trailer]?) -> ())) {
        AF.request("\(Constants.API.baseURL)/movie/\(movieId)/videos?api_key=\(Constants.API.key)&language=en-US&page=1").responseDecodable(of: TrailerList.self) { response in
            debugPrint(response)
            switch response.result {
            case .success(let trailerList):
                completion(trailerList.results)
            case .failure( _):
                completion(nil)
            }
        }
    }
    
}
