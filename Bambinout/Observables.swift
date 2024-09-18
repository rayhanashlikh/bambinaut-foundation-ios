import Combine
import Foundation

class SearchDataModel: ObservableObject {
    @Published var searchText: String = ""
}

class BabyDataModel: ObservableObject {
    @Published var babyData: BabyData
    
    init(babyData: BabyData) {
        self.babyData = babyData
    }
}
