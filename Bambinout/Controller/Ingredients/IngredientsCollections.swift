//
//  IngredientsCollections.swift
//  Bambinout
//
//  Created by MacBook Air on 18/09/24.
//

import SwiftUI

struct IngredientsCollections: UIViewControllerRepresentable {
    @Binding var search: String
    @Binding var foodMonthData: FoodMonthRange
    @Binding var ingredients: [Ingredient]
    
    func makeUIViewController(context: Context) -> IngredientsController {
        print("ingredient: \(ingredients.count)")
        return IngredientsController(foodMonthData: foodMonthData, ingredients: ingredients)
    }

    func updateUIViewController(_ uiViewController: IngredientsController, context: Context) {
        uiViewController.updateSearchText(search)
        uiViewController.updateFoodMonthData(foodMonthData)
    }
}
