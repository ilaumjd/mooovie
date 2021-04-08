//
//  MovieList.swift
//  Mooovie
//
//  Created by aku pintar indonesia on 08/04/21.
//

import Foundation

// MARK: - Movie List
struct MovieList: Codable {
    let page: Int
    let results: [Movie]
    let dates: MovieList_Dates
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results, dates
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Dates
struct MovieList_Dates: Codable {
    let maximum, minimum: String
}

enum MovieList_OriginalLanguage: String, Codable {
    case en = "en"
    case sv = "sv"
}
