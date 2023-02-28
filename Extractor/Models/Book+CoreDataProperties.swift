//
//  Book+CoreDataProperties.swift
//  Extractor
//
//  Created by Yunfang Li on 2/26/23.
//
//

import Foundation
import CoreData


extension Book {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Book> {
        return NSFetchRequest<Book>(entityName: "Book")
    }

    @NSManaged public var addedTime: Date?
    @NSManaged public var modifiedTime: Date?
    @NSManaged public var name: String?
    @NSManaged public var url: URL?
    @NSManaged public var readPosition: BookPosition?

}

extension Book : Identifiable {

}
