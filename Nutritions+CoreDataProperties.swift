//
//  Nutritions+CoreDataProperties.swift
//  Bambinout
//
//  Created by MacBook Air on 20/09/24.
//
//

import Foundation
import CoreData


extension Nutritions {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Nutritions> {
        return NSFetchRequest<Nutritions>(entityName: "Nutritions")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var ingredients: NSSet?

}

// MARK: Generated accessors for ingredients
extension Nutritions {

    @objc(addIngredientsObject:)
    @NSManaged public func addToIngredients(_ value: Ingredients)

    @objc(removeIngredientsObject:)
    @NSManaged public func removeFromIngredients(_ value: Ingredients)

    @objc(addIngredients:)
    @NSManaged public func addToIngredients(_ values: NSSet)

    @objc(removeIngredients:)
    @NSManaged public func removeFromIngredients(_ values: NSSet)

}

extension Nutritions : Identifiable {

}
