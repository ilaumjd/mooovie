//
//  MooovieTests.swift
//  MooovieTests
//
//  Created by aku pintar indonesia on 29/04/21.
//

import XCTest

@testable import Mooovie

class MooovieTests: XCTestCase {
    
    let id = 1234
    let title = "Mortal Kombat"
    let poster = "https://..."
    
    override func setUp() {
        super.setUp()
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
