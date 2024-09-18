import SwiftUI


struct IngredientsView: View {
    @StateObject private var searchDataModel = SearchDataModel()
    @State private var selectedCategory = "All"
    let categories = ["All", "6-8 M", "8-10 M", "10-12 M"]
    private var dummyBabyData = BabyDataModel(
        id: 1,
        allergy_ids: [1,3],
        latest_weight: 6,
        latest_weight_date: getDate(date: "2024-09-13"),
        birth_date: getDate(date: "2024-02-03")
    )
    var body: some View {
        ZStack{
            NavigationStack {
                VStack {
                    // Category Filter
                    Picker("Category", selection: $selectedCategory) {
                                       ForEach(categories, id: \.self) { category in
                                           Text(category).tag(category)
                                       }
                                   }
                                   .pickerStyle(SegmentedPickerStyle())
                                   .padding(.leading)
                                   .padding(.trailing)
                    IngredientCollections(search: $searchDataModel.searchText)
                }
                .navigationTitle("Ingredients")
                .navigationBarTitleDisplayMode(.large)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                                     Button(action: {
                                         // Navigate to ProfileView
                                     }) {
                                         Image(systemName: "person.circle.fill")
                                             .resizable()
                                             .frame(width: 40,height: 40)
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
