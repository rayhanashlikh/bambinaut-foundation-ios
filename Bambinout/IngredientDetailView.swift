import SwiftUI

struct IngredientDetailView: View {
    let ingredient: IngredientData
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(ingredient.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding().clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                
                Text(ingredient.name)
                    .font(.largeTitle)
                
                Text(ingredient.description)
                    .padding()
            }.padding()
                .background(.red)
        }.navigationTitle("Ingredient detail")
            .padding()
        
    }
}


