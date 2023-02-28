//
//  Card+CoreDataProperties.swift
//  Extractor
//
//  Created by Yunfang Li on 2/26/23.
//
//

import Foundation
import CoreData


extension Card {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Card> {
        return NSFetchRequest<Card>(entityName: "Card")
    }

    @NSManaged public var knownLevel: Int16
    @NSManaged public var note: String?
    @NSManaged public var name: String?
    @NSManaged public var referencePosition: NSSet?

}

// MARK: Generated accessors for referencePosition
extension Card {

    @objc(addReferencePositionObject:)
    @NSManaged public func addToReferencePosition(_ value: BookPosition)

    @objc(removeReferencePositionObject:)
    @NSManaged public func removeFromReferencePosition(_ value: BookPosition)

    @objc(addReferencePosition:)
    @NSManaged public func addToReferencePosition(_ values: NSSet)

    @objc(removeReferencePosition:)
    @NSManaged public func removeFromReferencePosition(_ values: NSSet)

}

extension Card : Identifiable {

}
