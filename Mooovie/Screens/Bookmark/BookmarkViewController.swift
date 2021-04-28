//
//  BookmarkViewController.swift
//  Mooovie
//
//  Created by aku pintar indonesia on 28/04/21.
//

import UIKit

class BookmarkViewController: UIViewController {
    
    static func create() -> BookmarkViewController {
        let vc = BookmarkViewController()
        return vc
    }
    
}


// MARK: LIFECYCLE
extension BookmarkViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(CoreDataManager.shared.getBookmarks())
    }
    
}
