//
//  InputAllergiesView.swift
//  Bambinout
//
//  Created by MacBook Air on 17/09/24.
//

import SwiftUI

struct InputAllergiesView: View {
    
    struct Allergies: Identifiable {
        let name: String
        let id = UUID()
    }

    private var oceans = [
        Allergies(name: "Seafood"),
        Allergies(name: "Dairy"),
        Allergies(name: "Peanut"),
        Allergies(name: "Soy"),
        Allergies(name: "Egg")
    ]
    
    
    @State private var multiSelection = Set<UUID>()
    var body: some View {
        
        NavigationView {
            List(oceans, selection: $multiSelection) {
                Text($0.name)
            }
            .navigationTitle("Input Allergies")
            .toolbar { EditButton() }
        }
        Text("\(multiSelection.count) selections")
        
    }
}

#Preview {
    InputAllergiesView()
}
