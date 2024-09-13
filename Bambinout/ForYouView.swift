//
//  ForYouView.swift
//  Bambinout
//
//  Created by MacBook Air on 13/09/24.
//

import SwiftUI
struct ForYouView: View {
    @StateObject private var searchDataModel = SearchDataModel()
    var body: some View {
        NavigationStack {
           VStack {
               IngredientCollections(search: $searchDataModel.searchText)
           }
           .navigationTitle("For You")
        }.searchable(text: $searchDataModel.searchText)
        .environmentObject(searchDataModel)
    }
    
    private func searchIngredient(newValue: String) {
        
    }
}

#Preview {
    ForYouView()
}
