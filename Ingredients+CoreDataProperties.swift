//
//  Ingredients+CoreDataProperties.swift
//  Bambinout
//
//  Created by MacBook Air on 20/09/24.
//
//

import Foundation
import CoreData


extension Ingredients {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ingredients> {
        return NSFetchRequest<Ingredients>(entityName: "Ingredients")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var max_months: Int16
    @NSManaged public var descriptions: String?
    @NSManaged public var min_months: Int16
    @NSManaged public var nutritions: NSSet?
    @NSManaged public var allergy: Allergy?

}

// MARK: Generated accessors for nutritions
extension Ingredients {

    @objc(addNutritionsObject:)
    @NSManaged public func addToNutritions(_ value: Nutritions)

    @objc(removeNutritionsObject:)
    @NSManaged public func removeFromNutritions(_ value: Nutritions)

    @objc(addNutritions:)
    @NSManaged public func addToNutritions(_ values: NSSet)

    @objc(removeNutritions:)
    @NSManaged public func removeFromNutritions(_ values: NSSet)

}

extension Ingredients : Identifiable {

}
