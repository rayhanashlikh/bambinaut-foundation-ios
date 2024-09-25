import Combine
import Foundation

class SearchDataModel: ObservableObject {
    @Published var searchText: String = ""
}

class RecommendationDataModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var data: [Ingredient] = []
    @Published var allergies: [Allergy] = []
    @Published var isShowNav: Bool = false
}

class BabyDataModel: ObservableObject {
    @Published var babyData: BabyData
    
    init(babyData: BabyData) {
        self.babyData = babyData
    }
}
