import SwiftUI

struct IngredientDetailView: View {
    let ingredient: IngredientData
    
    var body: some View {
        NavigationStack {
            ScrollView {
                
                VStack {
                    Image(ingredient.imageName)
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                    HStack {
                        Text(ingredient.name)
                            .font(.title)
                        Spacer()
                    }
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(ingredient.nutrition_ids, id: \.self) { item in
                                Text(item.name)
                                    .padding(10)
                                    .background(Color.white)
                                    .cornerRadius(10)
                            }
                        }
                    }.scrollIndicators(.hidden)
                    
                    HStack {
                        Text(ingredient.description)
                        Spacer()
                    }
                }.padding(25)
                    .background(Color("background-blue"))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
            }.navigationTitle("Ingredient detail")
                .padding()
            }
    }
}

#Preview {
    IngredientDetailView(ingredient: getDummyIngredients(n: 1)[0])
}

