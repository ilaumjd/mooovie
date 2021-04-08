//
//  MovieService.swift
//  Mooovie
//
//  Created by aku pintar indonesia on 08/04/21.
//

import Alamofire

class MovieService: MovieServiceProtocol {
    
    func fetchList(completion: @escaping (() -> ())) {
//        AF.request("https://api.openweathermap.org/data/2.5/weather?q=\(city)&units=\(unit)&appid=\(TokenConstants.openweathermap)").responseDecodable(of: Weather.self) { response in
//            debugPrint(response)
//            switch response.result {
//            case .success(let weather):
//                completion(weather)
//            case .failure(let error):
//                debugPrint(error)
//                completion(nil)
//            }
//        }
        AF.request("\(Constants.API.baseURL)/movie/now_playing?api_key=\(Constants.API.key)&language=en-US&page=1").response { response in
            debugPrint(response)
        }
    }
    
}
