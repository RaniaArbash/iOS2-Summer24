//
//  Car+CoreDataProperties.swift
//  week11
//
//  Created by Rania Arbash on 2024-07-18.
//
//

import Foundation
import CoreData


extension Car {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Car> {
        return NSFetchRequest<Car>(entityName: "Car")
    }

    @NSManaged public var model: String?
    @NSManaged public var make: Int64
    @NSManaged public var ownedBy: Owner?

}

extension Car : Identifiable {

}
