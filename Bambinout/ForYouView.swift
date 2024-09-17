//
//  ForYouView.swift
//  Bambinout
//
//  Created by MacBook Air on 13/09/24.
//

import SwiftUI
struct ForYouView: View {
    @StateObject private var searchDataModel = SearchDataModel()
    private var dummyBabyData = BabyDataModel(
        id: 1,
        allergy_ids: [1,3],
        latest_weight: 6,
        latest_weight_date: getDate(date: "2024-09-13"),
        birth_date: getDate(date: "2024-02-03")
    )
    var body: some View {
        NavigationStack {
           VStack {
               IngredientCollections(search: $searchDataModel.searchText)
           }
           .navigationTitle("For You")
        }.searchable(text: $searchDataModel.searchText)
        .environmentObject(searchDataModel)
    }
}

#Preview {
    ForYouView()
}
