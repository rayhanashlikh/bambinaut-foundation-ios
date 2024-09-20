//
//  Allergy+CoreDataProperties.swift
//  Bambinout
//
//  Created by MacBook Air on 20/09/24.
//
//

import Foundation
import CoreData


extension Allergy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Allergy> {
        return NSFetchRequest<Allergy>(entityName: "Allergy")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var ingredients: NSSet?

}

// MARK: Generated accessors for ingredients
extension Allergy {

    @objc(addIngredientsObject:)
    @NSManaged public func addToIngredients(_ value: Ingredients)

    @objc(removeIngredientsObject:)
    @NSManaged public func removeFromIngredients(_ value: Ingredients)

    @objc(addIngredients:)
    @NSManaged public func addToIngredients(_ values: NSSet)

    @objc(removeIngredients:)
    @NSManaged public func removeFromIngredients(_ values: NSSet)

}

extension Allergy : Identifiable {

}
