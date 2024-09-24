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
    var status: Bool = false
    
    @Relationship()
    var ingredients: [Ingredient]
    
    init(name: String, status: Bool, ingredients: [Ingredient]) {
        self.id = UUID()
        self.name = name
        self.ingredients = ingredients
        self.status = status
    }
}
