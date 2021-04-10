//
//  TrailerViewModel.swift
//  Mooovie
//
//  Created by aku pintar indonesia on 11/04/21.
//

import Foundation

struct TrailerViewModel {
    var model: Trailer
}

extension TrailerViewModel {
    
    var key: String {
        model.key ?? ""
    }
    
    var name: String {
        model.name ?? ""
    }
    
}
