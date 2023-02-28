//
//  BookPosition+CoreDataProperties.swift
//  Extractor
//
//  Created by Yunfang Li on 2/26/23.
//
//

import Foundation
import CoreData


extension BookPosition {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BookPosition> {
        return NSFetchRequest<BookPosition>(entityName: "BookPosition")
    }

    @NSManaged public var abstract: String?
    @NSManaged public var column: Int64
    @NSManaged public var line: Int64
    @NSManaged public var page: Int64
    @NSManaged public var fromBook: Book?
    @NSManaged public var fromCard: Card?

}

extension BookPosition : Identifiable {

}
