//
//  ForYouView.swift
//  Bambinout
//
//  Created by MacBook Air on 13/09/24.
//

import SwiftUI
struct ForYouView: View {
    @StateObject private var searchDataModel = SearchDataModel()
    @StateObject private var dummyBabyData = BabyDataModel(babyData: getDummyBaby())
    var body: some View {
        NavigationStack {
           VStack {
               IngredientCollections(search: $searchDataModel.searchText, babyData: $dummyBabyData.babyData)
           }
           .navigationTitle("For You")
        }.searchable(text: $searchDataModel.searchText)
        .environmentObject(searchDataModel)
    }
}

#Preview {
    ForYouView()
}
