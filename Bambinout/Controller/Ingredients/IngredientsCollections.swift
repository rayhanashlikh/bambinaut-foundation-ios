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
    
    func makeUIViewController(context: Context) -> IngredientsController {
        return IngredientsController(foodMonthData: foodMonthData)
    }

    func updateUIViewController(_ uiViewController: IngredientsController, context: Context) {
        uiViewController.updateSearchText(search)
        uiViewController.updateFoodMonthData(foodMonthData)
    }
}
