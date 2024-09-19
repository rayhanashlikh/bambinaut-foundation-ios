import Foundation

class searchDataModel: ObservableObject { // Changed from 'searchDataModel' to 'SearchDataModel'
    @Published var searchText = "" {
        didSet {
            filterIngredients()
        }
    }
    
    @Published var filteredIngredients: [IngredientData] = []
    
    var allIngredients: [IngredientData] = getDummyIngredients(n: 10) // Ensure getDummyIngredients is called correctly
    
    init() {
        filterIngredients() // Initialize with all data
    }
    
    func filterIngredients() {
        if searchText.isEmpty {
            filteredIngredients = allIngredients
        } else {
            filteredIngredients = allIngredients.filter { ingredient in
                ingredient.name.lowercased().contains(searchText.lowercased()) ||
                ingredient.description.lowercased().contains(searchText.lowercased())
            }
        }
    }
}
