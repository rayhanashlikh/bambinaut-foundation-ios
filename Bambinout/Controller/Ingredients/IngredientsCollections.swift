//
//  IngredientsCollections.swift
//  Bambinout
//
//  Created by MacBook Air on 18/09/24.
//

import SwiftUI

struct IngredientsCollections: UIViewControllerRepresentable {
    @Binding var search: String
    @Binding var babyData: BabyData
    
    func makeUIViewController(context: Context) -> ForYouViewController {
        return ForYouViewController(babyData: babyData)
    }

    func updateUIViewController(_ uiViewController: ForYouViewController, context: Context) {
        uiViewController.updateSearchText(search)
    }
}
