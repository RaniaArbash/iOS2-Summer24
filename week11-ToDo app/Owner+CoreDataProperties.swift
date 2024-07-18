//
//  Owner+CoreDataProperties.swift
//  week11
//
//  Created by Rania Arbash on 2024-07-18.
//
//

import Foundation
import CoreData


extension Owner {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Owner> {
        return NSFetchRequest<Owner>(entityName: "Owner")
    }

    @NSManaged public var namr: String?
    @NSManaged public var yob: Int32
    @NSManaged public var id: Int16
    @NSManaged public var cars: NSSet?

}

// MARK: Generated accessors for cars
extension Owner {

    @objc(addCarsObject:)
    @NSManaged public func addToCars(_ value: Car)

    @objc(removeCarsObject:)
    @NSManaged public func removeFromCars(_ value: Car)

    @objc(addCars:)
    @NSManaged public func addToCars(_ values: NSSet)

    @objc(removeCars:)
    @NSManaged public func removeFromCars(_ values: NSSet)

}

extension Owner : Identifiable {

}
