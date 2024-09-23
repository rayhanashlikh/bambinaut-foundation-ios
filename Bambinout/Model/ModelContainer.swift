//
//  ModelContainer.swift
//  Bambinout
//
//  Created by MacBook Air on 23/09/24.
//

import Foundation
import SwiftData

let container = try? ModelContainer(
    for:
        Ingredient.self,
        Allergy.self,
        Nutrition.self,
        Baby.self
)
