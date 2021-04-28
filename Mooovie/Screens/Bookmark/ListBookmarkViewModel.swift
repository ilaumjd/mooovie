//
//  ListBookmarkViewModel.swift
//  Mooovie
//
//  Created by aku pintar indonesia on 28/04/21.
//

import RxSwift
import RxCocoa

class ListBookmarkViewModel {
    
    let bookmarks = BehaviorRelay<[Bookmark]>(value: [])
    
}

extension ListBookmarkViewModel {
    
    func fetchBookmarks() {
        let bookmarks = CoreDataManager.shared.getBookmarks()
        self.bookmarks.accept(bookmarks)
    }
    
}
