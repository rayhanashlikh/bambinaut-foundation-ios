//
//  Allergy.swift
//  Bambinout
//
//  Created by MacBook Air on 23/09/24.
//

import Foundation
import SwiftData

@Model
class Allergy: Identifiable {
    var id: UUID
    var name: String
    var babies: [Baby]
    
    @Relationship()
    var ingredients: [Ingredient]
    
    init(name: String, babies: [Baby], ingredients: [Ingredient]) {
        self.id = UUID()
        self.name = name
        self.babies = babies
        self.ingredients = ingredients
    }
}
