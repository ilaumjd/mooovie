//
//  Category.swift
//  Mooovie
//
//  Created by aku pintar indonesia on 11/04/21.
//

import Foundation

struct Category {
    var name: String
    var key: String
}

extension Category {
    
    static var nowPlaying: Category {
        Category(name: "Now Playing", key: "now_playing")
    }
    
    static var popular: Category {
        Category(name: "Popular", key: "popular")
    }
    
    static var topRated: Category {
        Category(name: "Top Rated", key: "top_rated")
    }
    
    static func all() -> [Category] {
        return [nowPlaying, popular, topRated]
    }
    
}
