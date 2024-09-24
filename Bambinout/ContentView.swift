import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var context
    @Query var nutritions: [Nutrition]
    @Query var allergies: [Allergy]
    
    var body: some View {
        TabBarView().onAppear() {
            if nutritions.count == 0 {
                for nutrition in seedNutritions {
                    let newNutrition = Nutrition(name: nutrition, ingredients: [])
                    // Save newNutrition to your SwiftData context
                    // Assuming you have a context variable
                    context.insert(newNutrition)
                    do {
                        try context.save()
                    } catch {
                        print("Failed to save \(nutrition): \(error)")
                    }
                }
            }
            
            if allergies.count == 0 {
                for allergy in seedAllergies {
                    let newAllergy = Allergy(name: allergy, ingredients: [])
                    // Save newNutrition to your SwiftData context
                    // Assuming you have a context variable
                    context.insert(newAllergy)
                    do {
                        try context.save()
                    } catch {
                        print("Failed to save \(allergy): \(error)")
                    }
                }
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
