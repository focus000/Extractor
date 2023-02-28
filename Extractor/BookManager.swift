//
//  DocsMgr.swift
//  Extractor
//
//  Created by Yunfang Li on 2/24/23.
//

import Foundation
import CoreData

class BookManager {
    var context: NSManagedObjectContext
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    func Add(url: URL) {
        let newBook = Book(context: self.context)
        newBook.url = url
        newBook.name = url.lastPathComponent
        newBook.addedTime = Date()
        newBook.modifiedTime = newBook.addedTime
        newBook.readPosition = BookPosition(context: self.context)
        do {
            try self.context.save()
        } catch {
            let nsErr = error as NSError
            fatalError("unresolved error \(nsErr), \(nsErr.userInfo)")
        }
    }
}
