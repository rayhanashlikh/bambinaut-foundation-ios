import SwiftUI

struct IngredientDetailView: View {
    let ingredient: IngredientData
    
    var body: some View {
        VStack {
            Text(ingredient.name)
                .font(.largeTitle)
                .padding()
            
            // Assuming you have an image asset with the name
            Image(ingredient.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding()
            
            Text(ingredient.description)
                .padding()
        }
    }
}

