//
//  Nutrition.swift
//  Bambinout
//
//  Created by MacBook Air on 23/09/24.
//

import Foundation
import SwiftData

@Model
class Nutrition {
    var id: UUID
    var name: String
    var ingredients: [Ingredient]
    
    init(name: String) {
        self.id = UUID()
        self.name = name
    }
}
