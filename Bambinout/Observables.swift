import Combine
import Foundation

class SearchDataModel: ObservableObject {
    @Published var searchText: String = ""
}

class IngredientDataModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var ingredients: [Ingredient] = []
}

class RecommendationDataModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var data: [Ingredient] = []
    @Published var allergies: [Allergy] = []
}

class BabyDataModel: ObservableObject {
    @Published var babyData: BabyData
    
    init(babyData: BabyData) {
        self.babyData = babyData
    }
}
