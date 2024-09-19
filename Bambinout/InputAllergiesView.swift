//
//  InputAllergiesView.swift
//  Bambinout
//
//  Created by MacBook Air on 17/09/24.
//

import SwiftUI

struct Allergies: Identifiable {
    let name: String
    let id = UUID()
}

struct InputAllergiesView: View {
    
    

    private var allergyList = [
        Allergies(name: "Seafood"),
        Allergies(name: "Dairy"),
        Allergies(name: "Peanut"),
        Allergies(name: "Soy"),
        Allergies(name: "Egg")
    ]
    @State private var selectedAllergies: Set<UUID> = []
    
    @State private var multiSelection = Set<UUID>()
    var body: some View {
        
        NavigationView {
            List(allergyList) { allergy in
                HStack {
                    Text(allergy.name)
                    Spacer()
                    if selectedAllergies.contains(allergy.id) {
                        Image(systemName: "checkmark")
                            .foregroundColor(.blue)
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    if selectedAllergies.contains(allergy.id) {
                        selectedAllergies.remove(allergy.id)
                    } else {
                        selectedAllergies.insert(allergy.id)
                    }
                }
            }.navigationTitle("Select Allergies").navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing: Button("Done") {
                    saveChanges()
                })
        }
        
        
    }
    
    private func saveChanges() {
            // Handle the save action here
            print("Selected allergies: \(selectedAllergies.map { $0 })")
        }
}

#Preview {
    InputAllergiesView()
}
