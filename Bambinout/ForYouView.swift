//
//  ForYouView.swift
//  Bambinout
//
//  Created by MacBook Air on 13/09/24.
//

import SwiftUI
struct ForYouView: View {
    @StateObject private var searchDataModel = SearchDataModel()
    @State var dummyBabyData: BabyData = getDummyBaby()
    var body: some View {
        NavigationStack {
           VStack {
               ForYouCollections(search: $searchDataModel.searchText, babyData: $dummyBabyData)
           }
           .navigationTitle("For You")
        }.searchable(text: $searchDataModel.searchText)
        .environmentObject(searchDataModel)
    }
}

#Preview {
    ForYouView()
}
