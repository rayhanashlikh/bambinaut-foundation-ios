import SwiftUI

struct IngredientDetailView: View {
    let ingredient: Ingredient
    
    var body: some View {
        NavigationStack {
            ScrollView {
                
                VStack {
                    ZStack {
                            Image(ingredient.imageName)
                                .resizable()
                                .scaledToFit()
                                .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                                .padding()
                                .background(.white)
                                .cornerRadius(25)
                        if ingredient.allergy != nil {
                            VStack {
                                HStack {
                                    Spacer()
                                    Button("\(ingredient.allergy!.name) allergen") {
                                        
                                    }.padding(8)
                                        .background(.red)
                                        .cornerRadius(25)
                                        .foregroundColor(.white)
                                }.padding(8)
                                Spacer()
                            }
                        } else {
                            VStack {
                                HStack {
                                    Spacer()
                                    Button("No allergen") {
                                        
                                    }.padding(8)
                                        .background(.green)
                                        .cornerRadius(25)
                                        .foregroundColor(.white)
                                }.padding(8)
                                Spacer()
                            }
                        }
                    }
                    HStack {
                        Text(ingredient.name)
                            .font(.title)
                        Spacer()
                    }
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(ingredient.nutritions, id: \.self) { item in
                                Text(item.name)
                                    .padding(10)
                                    .background(Color.white)
                                    .cornerRadius(10)
                            }
                        }
                    }.scrollIndicators(.hidden)
                    
                    HStack {
                        Text(ingredient.descriptions)
                        Spacer()
                    }.padding(.top)
                }.padding(25)
                    .background(Color("background-blue"))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
            }.navigationTitle("Ingredient detail")
                .padding()
            }
    }
}

//#Preview {
//    IngredientDetailView(ingredient: getDummyIngredients(n: 1)[0])
//}

