//
//  MovieTests.swift
//  MooovieTests
//
//  Created by aku pintar indonesia on 29/04/21.
//

import XCTest
import RxSwift
import RxTest

@testable import Mooovie

class MovieTests: XCTestCase {
    
    private let disposeBag = DisposeBag()

    func test_selectCategory() {
        let scheduler = TestScheduler(initialClock: 0)
        let testObserver = scheduler.createObserver(String.self)
        
        let vm = ListViewModel(service: MockMovieService())
        
        vm.category
            .skip(1)
            .map { $0.key }
            .subscribe(testObserver)
            .disposed(by: disposeBag)
        
        scheduler.start()
        
        vm.category.accept(Category.nowPlaying)
        vm.category.accept(Category.popular)
        vm.category.accept(Category.topRated)
        
        let correctEvents = Recorded.events(
            .next(0, "now_playing"),
            .next(0, "popular"),
            .next(0, "top_rated")
        )
        
        XCTAssertEqual(testObserver.events, correctEvents)
    }

}
