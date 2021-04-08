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
            case .failure(let error):
                debugPrint(error)
                completion(nil)
            }
        }
    }
    
}
