import SwiftUI


struct IngredientsView: View {
    @StateObject private var searchDataModel = SearchDataModel()
    @State private var selectedCategory = FoodMonthRange(title: "All", min: nil, max: nil)
    let categories = getFoodMonthCategories()
    var body: some View {
        ZStack{
            NavigationStack {
                VStack {
                    // Category Filter
                    Picker("Category", selection: $selectedCategory) {
                                       ForEach(categories, id: \.self) { category in
                                           Text(category.title).tag(category)
                                       }
                                   }
                                   .pickerStyle(SegmentedPickerStyle())
                                   .padding(.leading)
                                   .padding(.trailing)
                                   .onChange(of: selectedCategory) { foodMonthData in
                                       // Update the foodMonthData property in your IngredientsController
                                       let ingredientsController = IngredientsController(foodMonthData: foodMonthData)
                                       ingredientsController.updateFoodMonthData(foodMonthData)
                                   }
                    IngredientsCollections(search: $searchDataModel.searchText,foodMonthData: $selectedCategory)
                    
                }
                .navigationTitle("Ingredients")
                .navigationBarTitleDisplayMode(.large)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: ProfileView()) {
                                                  Image(systemName: "person.circle.fill")
                                                      .resizable()
                                                      .frame(width: 40, height: 40)
                                                      .foregroundColor(.black)
                                     }
                                 }
                             }
            }.searchable(text: $searchDataModel.searchText)
                .environmentObject(searchDataModel)
        }
    }
}
struct Ingredient: Identifiable {
    let id = UUID()
    let name: String
    let image: String
}
struct IngredientsView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsView()
    }
}
