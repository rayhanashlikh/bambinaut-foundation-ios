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

struct AppColors {
    static let lightBlue = "#D1E9F6"
    static let beige = "#F6EACB"
    static let peach = "#F1D3CE"
    static let pink = "#EECAD5"
}

extension UIColor {
  convenience init?(hexString hex: String) {
    var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if cString.hasPrefix("#") {
      cString.remove(at: cString.startIndex)
    }

    guard cString.count == 6 else {
      return nil
    }

    var rgbValue: UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)

    self.init(
      red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
      green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
      blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
      alpha: CGFloat(1.0)
    )
  }
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
