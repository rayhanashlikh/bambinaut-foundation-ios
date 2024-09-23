//
//  Ingredients.swift
//  Bambinout
//
//  Created by MacBook Air on 23/09/24.
//

import Foundation
import SwiftData

@Model
class Ingredient: Identifiable {
    var id: UUID
    var imageName: String
    var name: String
    var descriptions: String
    var min_months: Int
    var max_months: Int
    var for_weight_status: Int // -1 = untuk bayi underweight; 0 = normal; 1 = untuk bayi overweight
    
    @Relationship(deleteRule: .cascade)
    var allergy: Allergy?
    
    @Relationship(inverse: \Nutrition.ingredients)
    var nutritions: [Nutrition]
    
    init(imageName: String, name: String, descriptions: String, allergy: Allergy?, min_months: Int, max_months: Int, nutritions: [Nutrition], for_weight_status: Int) {
        self.id = UUID()
        self.imageName = imageName
        self.name = name
        self.descriptions = descriptions
        self.allergy = allergy
        self.min_months = min_months
        self.max_months = max_months
        self.nutritions = nutritions
        self.for_weight_status = for_weight_status
    }
}
