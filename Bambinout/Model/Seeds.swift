//
//  Seeds.swift
//  Bambinout
//
//  Created by MacBook Air on 24/09/24.
//

import Foundation
import SwiftData
import SwiftUI




let seedNutritions = [
    "Vitamin A",
    "Vitamin C",
    "Vitamin D",
    "Vitamin E",
    "Vitamin K",
    "Vitamin B1",
    "Vitamin B2",
    "Vitamin B3",
    "Vitamin B6",
    "Vitamin B12",
    "Folate",
    "Fiber",
    "Potassium",
    "Calcium",
    "Iron",
    "Selenium",
    "Zinc",
    "Omega-3 Fatty Acids",
    "Omega 6",
    "Healthy Fats",
    "Protein",
    "Carbohydrates",
    "Antioxidants",
    "Manganese",
    "Beta-carotene",
    "Collagen"
]

let seedAllergies = [
    "Seafood",
    "Dairy",
    "Nuts",
    "Egg",
    "Gluten",
]

let seedIngredients: [(name: String, minMonths: Int, maxMonths: Int, allergen: String?, nutritions: [String], weightSuitability: Int, description: String)] = [
    ("Carrot", 6, 8, nil, ["Vitamin A", "Fiber", "Potassium"], 0, "A crunchy root vegetable rich in beta-carotene and fiber."),
    ("Peas", 6, 8, nil, ["Vitamin K", "Protein", "Fiber"], 0, "Small, sweet green spheres packed with nutrients."),
    ("Banana", 6, 8, nil, ["Potassium", "Vitamin C", "Fiber"], -1, "A soft, sweet fruit known for its high potassium content."),
    ("Avocado", 6, 8, nil, ["Healthy Fats", "Vitamin E", "Fiber"], 1, "A creamy fruit full of healthy fats and nutrients."),
    ("Apples (cooked)", 6, 8, nil, ["Vitamin C", "Fiber"], 0, "Cooked apples that are soft and naturally sweet."),
    ("Oatmeal", 6, 8, "Gluten", ["Fiber", "Iron", "Protein"], -1, "A warm, hearty grain perfect for breakfast."),
    ("Zucchini", 6, 8, nil, ["Vitamin C", "Potassium", "Fiber"], 0, "A versatile squash often used in savory and sweet dishes."),
    ("Pumpkin", 6, 8, nil, ["Vitamin A", "Fiber", "Potassium"], 0, "A sweet and nutritious squash used in pies and soups."),
    ("Chicken (pureed)", 8, 10, nil, ["Protein", "Iron", "Zinc"], 0, "Pureed chicken providing protein and essential minerals."),
    ("Pear (cooked)", 8, 10, nil, ["Vitamin C", "Fiber"], 0, "Soft, sweet cooked pears that are easy to digest."),
    ("Broccoli (cooked)", 8, 10, nil, ["Vitamin C", "Fiber", "Calcium"], 0, "A nutrient-dense vegetable known for its health benefits."),
    ("Mango (pureed)", 8, 10, nil, ["Vitamin A", "Vitamin C", "Fiber"], 0, "A sweet, tropical fruit rich in vitamins and flavor."),
    ("Yogurt (plain, whole milk)", 10, 12, "Dairy", ["Calcium", "Protein", "Probiotics"], 1, "Creamy yogurt that provides probiotics and nutrients."),
    ("Beef (pureed)", 10, 12, nil, ["Iron", "Protein", "Zinc"], 1, "Pureed beef rich in iron and essential vitamins."),
    ("Chickpeas (pureed)", 10, 12, nil, ["Protein", "Fiber", "Iron"], 0, "Creamy puree of chickpeas packed with protein and fiber."),
    ("Potatoes", 10, 12, nil, ["Vitamin C", "Potassium", "Fiber"], -1, "Soft, starchy tubers that are versatile and filling."),
    ("Spinach (cooked)", 10, 12, nil, ["Iron", "Vitamin K", "Fiber"], 0, "Leafy greens that are rich in iron and vitamins."),
    ("Whole Grain Bread", 10, 12, "Gluten", ["Fiber", "B Vitamins", "Iron"], -1, "Nutty and wholesome bread made from whole grains."),
    ("Cheese (soft, mild)", 10, 12, "Dairy", ["Calcium", "Protein", "Vitamin A"], 0, "A soft, mild cheese that is a good source of calcium."),
    ("Noodle / Pasta (cooked)", 10, 12, "Gluten", ["Carbohydrates", "B Vitamins", "Iron"], 0, "Soft pasta that is a staple in many cuisines."),
    ("Watermelon", 8, 10, nil, ["Vitamin C", "Vitamin A"], 0, "Juicy, hydrating fruit perfect for hot weather."),
    ("Tuna", 10, 12, "Seafood", ["Protein", "Omega-3 Fatty Acids", "Selenium", "Omega 6"], 1, "Flaky tuna packed with protein and healthy fats."),
    ("Almond", 10, 12, "Nuts", ["Healthy Fats", "Protein", "Vitamin E"], 1, "Crunchy nuts rich in healthy fats and vitamins."),
    ("Eggplant", 8, 10, nil, ["Fiber", "Antioxidants", "Vitamins B1 & B6"], 0, "A versatile vegetable that absorbs flavors well."),
    ("Corn", 6, 8, nil, ["Carbohydrates", "Fiber", "Vitamin C"], 0, "Sweet corn kernels packed with nutrients."),
    ("Tempe", 10, 12, "Nuts", ["Protein", "Fiber", "Iron"], 0, "Fermented soy product rich in protein and flavor."),
    ("Tofu", 8, 10, "Nuts", ["Protein", "Calcium", "Iron"], 0, "Soft soy product that is a great source of protein."),
    ("Pineapple", 6, 8, nil, ["Vitamin C", "Manganese", "Bromelain"], 0, "Tropical fruit known for its sweet, tangy flavor."),
    ("Chicken Feet", 10, 12, nil, ["Protein", "Collagen"], 0, "Rich in collagen, often used in soups and broths."),
    ("Lamb", 10, 12, nil, ["Protein", "Iron", "Zinc"], 0, "Tender meat rich in flavor and nutrients."),
    ("Salmon", 10, 12, "Seafood", ["Omega-3 Fatty Acids", "Protein"], 0, "Tender meat rich in flavor and nutrients."),
    ("Shrimp", 10, 12, "Seafood", ["Protein", "Selenium", "Vitamin B12"], 1, "Rich, flaky fish high in omega-3 fatty acids."),
    ("Clams", 10, 12, "Seafood", ["Protein", "Iron", "Vitamin B12"], 1, "Creamy fat used for cooking and baking."),
    ("Strawberry", 6, 8, nil, ["Vitamin C", "Antioxidants"], 0, "Tender fruit rich in vitamins."),
    ("Mushroom", 8, 10, nil, ["Fiber", "Vitamin D", "B Vitamins"], 0, "Savory fungi packed with nutrients and flavor."),
    ("Tomato", 6, 8, nil, ["Vitamin C", "Potassium", "Antioxidants"], 0, "Versatile fruit packed with nutrients and flavor."),
    ("Tubers", 6, 8, nil, ["Carbohydrates", "Fiber", "Vitamins"], 0, "Hearty root vegetables that are filling."),
    ("Orange", 6, 8, nil, ["Vitamin C", "Fiber", "Folate"], 0, "Nutritious fruit that is sweet and tangy."),
    ("Grape", 6, 8, nil, ["Vitamin C", "Antioxidants", "Fiber"], 0, "Sweet fruit known for its health benefits."),
    ("Octopus", 10, 12, "Seafood", ["Protein", "Omega-3 Fatty Acids", "Selenium"], 1, "Tender meat rich in flavor and nutrients."),
    ("Rice", 6, 8, nil, ["Carbohydrates", "B Vitamins", "Iron"], 0, "Tender, flavorful grain rich in nutrients."),
    ("Cabbage", 8, 10, nil, ["Vitamins K", "C", "Fiber"], -1, "Versatile vegetable that is nutritious and filling."),
    ("Asparagus", 8, 10, nil, ["Vitamins A", "K", "Folate", "C", "Potassium", "Phosphorus", "Vitamin E"], 0, "Crunchy vegetable often used in salads and stir-fries."),
    ("Cow Milk", 10, 12, "Dairy", ["Calcium", "Protein", "Vitamin D"], 0, "Nutrient-rich liquid that is versatile.")
]
