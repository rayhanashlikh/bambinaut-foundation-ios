//
//  Data.swift
//  NutrientApp
//
//  Created by MacBook Air on 07/09/24.
//

import SwiftUI

func getDate(date: String) -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    
    if let date = dateFormatter.date(from: date) {
        return date
    } else {
        return nil
    }
}

struct IngredientData {
    var imageName: String
    var name: String
    var description: String
    var allergy_id: Int?
    var min_months: Int
    var max_months: Int
    var for_weight_status: Int // -1 = untuk bayi underweight; 0 = normal; 1 = untuk bayi overweight
}

struct BabyData {
    var id: Int
    var allergy_ids: [Int]
    var latest_weight: Double
    var latest_weight_date: Date?
    var birth_date: Date?
    var gender: Int // 0 = female; 1 = male
    
    //mendapatkan umur bayi dalam bulan berdasarkan tanggal lahir
    func getAgeMonth() -> Int? {
        let calendar = Calendar.current
        let current = Date()
        guard self.birth_date ?? current <= current else {
            return nil
        }
        
        let components = calendar.dateComponents([.month], from: self.birth_date ?? current, to: current)
        return components.month
    }
    
    //mendapatkan status berat badan bayi
    //-1 = underweight; 0 = normal; 1 = overweight
    func getWeightStatus() -> Int {
        if (self.latest_weight >= getBabyOptimalWeightRange(age: self.getAgeMonth() ?? 0, gender: self.gender).max) {
            return 1
        } else if (self.latest_weight <= getBabyOptimalWeightRange(age: self.getAgeMonth() ?? 0, gender: self.gender).min) {
            return -1
        } else {
            return 0
        }
    }
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
    var ingredientData: [IngredientData] = []
    
    for _ in 0...n {
        let newData1 = IngredientData(
            imageName: "tomato",
            name: "Tomato",
            description: "This is Tomato",
            allergy_id: 1,
            min_months: 8,
            max_months: 10,
            for_weight_status: 1
        )
        let newData2 = IngredientData(
            imageName: "avocado",
            name: "Avocado",
            description: "This is avocado",
            allergy_id: 2,
            min_months: 6,
            max_months: 8,
            for_weight_status: -1
        )
        let newData3 = IngredientData(
            imageName: "water",
            name: "Water",
            description: "This is water",
            allergy_id: 1,
            min_months: 10,
            max_months: 12,
            for_weight_status: -1
        )
        let newData4 = IngredientData(
            imageName: "banana",
            name: "Banana",
            description: "This is banana",
            allergy_id: 3,
            min_months: 6,
            max_months: 8,
            for_weight_status: 1
        )
        let newData5 = IngredientData(
            imageName: "chicken",
            name: "Chicken",
            description: "This is chicken",
            allergy_id: 1,
            min_months: 6,
            max_months: 8,
            for_weight_status: -1
        )
        ingredientData.append(newData1)
        ingredientData.append(newData2)
        ingredientData.append(newData3)
        ingredientData.append(newData4)
        ingredientData.append(newData5)
    }
    
    return ingredientData
}

func getDummyBaby() -> BabyData {
    return BabyData(
        id: 1,
        allergy_ids: [],
        latest_weight: 19.3,
        latest_weight_date: getDate(date: "2024-09-13"),
        birth_date: getDate(date: "2024-02-03"),
        gender: 1
    )
}

var mainItem: [[Any]] = [
    ["avocado","Avocado","Fiber",Color.green],
    ["banana","Banana","Fiber",Color.green],
    ["chicken","Chicken","Protein",Color.green],
    ["water","Water","water",Color.green]
]

struct WeightRange {
    let min: Double
    let max: Double
}

// Define the type alias for age to weight range dictionary
typealias AgeWeightRanges = [String: WeightRange]

// Define the type alias for an array of weight ranges
typealias OptimalWeightRanges = [AgeWeightRanges]

// Define the main data structure
var optimalWeightRange: OptimalWeightRanges = [
    [
        "6": WeightRange(min: 5.7, max: 8.2),
        "7": WeightRange(min: 6.0, max: 8.6),
        "8": WeightRange(min: 6.3, max: 9.0),
        "9": WeightRange(min: 6.5, max: 9.3),
        "10": WeightRange(min: 6.7, max: 9.6),
        "11": WeightRange(min: 6.9, max: 9.9),
        "12": WeightRange(min: 7.0, max: 10.1)
    ],
    [
        "6": WeightRange(min: 6.4, max: 8.8),
        "7": WeightRange(min: 6.7, max: 9.2),
        "8": WeightRange(min: 6.9, max: 9.6),
        "9": WeightRange(min: 7.1, max: 9.9),
        "10": WeightRange(min: 7.4, max: 10.2),
        "11": WeightRange(min: 7.6, max: 10.5),
        "12": WeightRange(min: 7.7, max: 10.8)
    ]
]
func getDummyIngredients() -> [IngredientData] {
    return [
        IngredientData(imageName: "tomato", name: "Tomato", description: "A red vegetable", allergy_id: nil, min_months: 6, max_months: 8, for_weight_status: -1),
        IngredientData(imageName: "carrot", name: "Carrot", description: "Rich in vitamins", allergy_id: nil, min_months: 6, max_months: 10, for_weight_status: -1),
        IngredientData(imageName: "banana", name: "Banana", description: "Good source of fiber", allergy_id: nil, min_months: 6, max_months: 12, for_weight_status: -1),
        IngredientData(imageName: "avocado", name: "Avocado", description: "Great for healthy fats", allergy_id: nil, min_months: 6, max_months: 12, for_weight_status: -1),
      
    ]
}

func getBabyOptimalWeightRange(age: Int, gender: Int) -> WeightRange {
    let ret = optimalWeightRange[gender][String(age)]
    return ret ?? WeightRange(min: 5.7, max: 8.2)
}
