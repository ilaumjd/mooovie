//
//  MooovieTests.swift
//  MooovieTests
//
//  Created by aku pintar indonesia on 29/04/21.
//

import XCTest

@testable import Mooovie

class MooovieTests: XCTestCase {

    func test_isMovieBookmarked() {
        let movieId = 1234
        XCTAssertFalse(CoreDataManager.shared.isBookmarked(id: movieId))
        CoreDataManager.shared.addBookmark(id: movieId, title: "Mortal Kombat", poster: "")
        XCTAssertTrue(CoreDataManager.shared.isBookmarked(id: movieId))
    }

}
