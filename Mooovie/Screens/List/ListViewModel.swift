//
//  ListViewModel.swift
//  Mooovie
//
//  Created by aku pintar indonesia on 08/04/21.
//

import Foundation

class ListViewModel {
    
    private var service: MovieServiceProtocol
    
    init(service: MovieServiceProtocol) {
        self.service = service
    }
    
}

extension ListViewModel {
    
    func fetchList() {
        self.service.fetchList { movies in
            
        }
    }
    
}
