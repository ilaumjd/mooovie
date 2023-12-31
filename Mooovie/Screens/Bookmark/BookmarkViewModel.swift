//
//  BookmarkViewModel.swift
//  Mooovie
//
//  Created by aku pintar indonesia on 28/04/21.
//

import Foundation

struct BookmarkViewModel {
    var model: Bookmark
}

extension BookmarkViewModel {
    
    var id: Int {
        Int(model.id)
    }
    
    var title: String {
        model.title ?? ""
    }
    
    var poster: String {
        model.poster ?? ""
    }
    
}

extension BookmarkViewModel {
    
    func delete(completion: @escaping (() -> ())) {
        CoreDataManager.shared.deleteBookmark(id: id)
        completion()
    }
    
}
