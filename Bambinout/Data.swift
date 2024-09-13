//
//  Data.swift
//  NutrientApp
//
//  Created by MacBook Air on 07/09/24.
//

import SwiftUI

struct IngredientData {
    let imageName: String
    let name: String
    let description: String
    let allergy_id: Int?
    let min_months: Int
    let max_months: Int
    let for_weight_status: Int
}



func getDummyIngredients(n: Int) -> [IngredientData] {
    let ingredientData = IngredientData(
        imageName: "tomato",
        name: "Tomato",
        description: "ini adalah tomat",
        allergy_id: nil,
        min_months: 6,
        max_months: 8,
        for_weight_status: -1
    )
    
    var data: [IngredientData] = []
    for _ in 0...n {
        data.append(ingredientData)
    }
    
    return data
}

var mainItem: [[Any]] = [
    ["avocado","Avocado","Fiber",Color.green],
    ["banana","Banana","Fiber",Color.green],
    ["chicken","Chicken","Protein",Color.green],
    ["water","Water","water",Color.green]

]
