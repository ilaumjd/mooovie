//
//  BookmarkTests.swift
//  MooovieTests
//
//  Created by aku pintar indonesia on 29/04/21.
//

import XCTest
@testable import Mooovie

class BookmarkTests: XCTestCase {

    var id: Int!
    var title: String!
    var poster: String!
    
    override func setUp() {
        super.setUp()
        id = 1234
        title = "Mortal Kombat"
        poster = "https://..."
    }
    
    override func tearDown() {
        super.tearDown()
        CoreDataManager.shared.clearBookmarks()
    }
    
    func test_isMovieBookmarked() {
        XCTAssertFalse(CoreDataManager.shared.isBookmarked(id: self.id))
        CoreDataManager.shared.addBookmark(id: self.id, title: self.title, poster: self.poster)
        XCTAssertTrue(CoreDataManager.shared.isBookmarked(id: id))
    }
    
    func test_deleteBookmark() {
        CoreDataManager.shared.addBookmark(id: self.id, title: self.title, poster: self.poster)
        CoreDataManager.shared.deleteBookmark(id: self.id)
        XCTAssertFalse(CoreDataManager.shared.isBookmarked(id: self.id))
    }

}
