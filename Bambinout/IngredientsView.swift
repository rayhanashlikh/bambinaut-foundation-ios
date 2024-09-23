import SwiftUI


struct IngredientsView: View {
    @StateObject private var searchDataModel = SearchDataModel()
    @State private var selectedCategory = FoodMonthRange(title: "All", min: nil, max: nil)
    @State private var ingredients: [IngredientData] = [] // Your ingredients array
    let categories = getFoodMonthCategories()

    var body: some View {
        ZStack {
            NavigationStack {
                VStack(spacing: 0) {
                    // Category Filter
                    Picker("Category", selection: $selectedCategory) {
                        ForEach(categories, id: \.self) { category in
                            Text(category.title).tag(category)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal)
                    .padding(.top, 15)
                    .padding(.bottom, 10)
                    .onChange(of: selectedCategory) { newValue in
                        filterData(foodMonthData: newValue)
                    }

                    IngredientsCollections(search: $searchDataModel.searchText, foodMonthData: $selectedCategory)
                }
                .navigationBarTitleDisplayMode(.large)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        VStack {
                            Spacer()
                            Text("Ingredients")
                                .font(.largeTitle)
                                .bold()
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        VStack {
                            Spacer()
                            NavigationLink(destination: ProfileView()) {
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .frame(width: 33, height: 33)
                                    .foregroundColor(.black)
                            }
                        }
                        .searchable(text: $searchDataModel.searchText)
                    }
                }
            }.environmentObject(searchDataModel)
        }
    }

    // Define the filterData function here
    private func filterData(foodMonthData: FoodMonthRange) {
        print("Filtering ingredients...")

        if foodMonthData.min == nil && foodMonthData.max == nil {
            ingredients = getDummyIngredients(n: 5) // Load all ingredients
        } else {
            ingredients = getDummyIngredients(n: 5).filter { ingredient in
                (ingredient.min_months >= foodMonthData.min ?? 0) &&
                (ingredient.max_months <= foodMonthData.max ?? Int.max)
            }
        }

        print("Filtered data count: \(ingredients.count)")
        // Update UI if needed, but the state change should trigger it automatically
    }
}


//struct Ingredient: Identifiable {
//    let id = UUID()
//    let name: String
//    let image: String
//}
struct IngredientsView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsView()
    }
}
