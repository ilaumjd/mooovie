//
//  CoreDataManager.swift
//  Mooovie
//
//  Created by aku pintar indonesia on 28/04/21.
//

import Foundation
import UIKit
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    var moc: NSManagedObjectContext

    private init() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.moc = appDelegate.persistentContainer.viewContext
    }
    
    func addBookmark(id: Int, title: String, poster: String) {
        let bookmark = Bookmark(context: self.moc)
        bookmark.id = Int64(id)
        bookmark.title = title
        bookmark.poster = poster
        
        do {
            try self.moc.save()
        } catch let error {
            print(error)
        }
    }
    
    func getBookmarks() -> [Bookmark] {
        var bookmarks = [Bookmark]()
        let request: NSFetchRequest<Bookmark> = Bookmark.fetchRequest()
        request.returnsObjectsAsFaults = false
        
        do {
            bookmarks = try self.moc.fetch(request)
        } catch let error {
            print(error)
        }
        
        return bookmarks
    }
    
}
