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
    
    static var upcoming: Category {
        Category(name: "Upcoming", key: "upcoming")
    }
    
    static var topRated: Category {
        Category(name: "Top Rated", key: "top_rated")
    }
    
    static func all() -> [Category] {
        return [nowPlaying, upcoming, topRated]
    }
    
}
