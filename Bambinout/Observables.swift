import Combine
import Foundation

class SearchDataModel: ObservableObject {
    @Published var searchText: String = ""
}

class BabyDataModel: ObservableObject {
    @Published var id: Int
    @Published var allergy_ids: [Int]
    @Published var latest_weight: Int
    @Published var latest_weight_date: Date?
    @Published var birth_date: Date?
    
    init(id: Int, allergy_ids: [Int], latest_weight: Int, latest_weight_date: Date? = nil, birth_date: Date? = nil) {
        self.id = id
        self.allergy_ids = allergy_ids
        self.latest_weight = latest_weight
        self.latest_weight_date = latest_weight_date
        self.birth_date = birth_date
    }
}
