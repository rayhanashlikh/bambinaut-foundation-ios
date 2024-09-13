//
//  ForYouView.swift
//  Bambinout
//
//  Created by MacBook Air on 13/09/24.
//

import SwiftUI
struct ForYouView: View {
    @State private var recommendationSearchText: String = ""
    var body: some View {
        NavigationStack {
           VStack {
               IngredientCollections()
           }
           .navigationTitle("For You")
        }.searchable(text: $recommendationSearchText)
    }
}

#Preview {
    ForYouView()
}
