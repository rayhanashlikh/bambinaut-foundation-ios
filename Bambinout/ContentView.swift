import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var context
    @Query var nutritions: [Nutrition]
    @Query var allergies: [Allergy]
    @Query var ingredients: [Ingredient]
    
    var body: some View {
        TabBarView().onAppear() {
            if nutritions.count == 0 {
                for nutrition in seedNutritions {
                    let newNutrition = Nutrition(name: nutrition, ingredients: [])
                    // Save newNutrition to your SwiftData context
                    // Assuming you have a context variable
                    context.insert(newNutrition)
                }
            }
            if allergies.count == 0 {
                for allergy in seedAllergies {
                    let newAllergy = Allergy(name: allergy,  status: false, ingredients: [])
                    // Save newNutrition to your SwiftData context
                    // Assuming you have a context variable
                    context.insert(newAllergy)
                }
            }
            do {
                try context.delete(model: Ingredient.self)
            } catch {
                
            }
            if ingredients.count == 0 {
                for ingredient in seedIngredients {
                    let allergy = ingredient.allergen != nil ? allergies.first(where: { $0.name == ingredient.allergen }) : nil
                    let associatedNutritions = nutritions.filter { nutrition in ingredient.nutritions.contains(nutrition.name) }
                    let ingredient = Ingredient(
                        imageName: ingredient.imageName,
                        name: ingredient.name,
                        descriptions: ingredient.description,
                        allergy: allergy,
                        min_months: ingredient.minMonths,
                        max_months: ingredient.maxMonths,
                        nutritions: [],
                        for_weight_status: ingredient.weightSuitability
                    )
                    for nut in associatedNutritions {
                        ingredient.nutritions.append(nut)
                    }
                
                    context.insert(ingredient)
                }
            }
            do {
                try context.save()
            } catch {
                print("Failed to save data: \(error)")
            }
        }
    }
}
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

#Preview {
    ContentView()
}
