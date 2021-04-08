//
//  MovieServiceProtocol.swift
//  Mooovie
//
//  Created by aku pintar indonesia on 08/04/21.
//

import Foundation

protocol MovieServiceProtocol {
    
    func fetchList(completion: @escaping (([Movie]?) -> ()))
    
}
