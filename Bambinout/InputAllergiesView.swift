//
//  InputAllergiesView.swift
//  Bambinout
//
//  Created by MacBook Air on 17/09/24.
//

import SwiftUI
import SwiftData

struct InputAllergiesView: View {
    @Environment(\.modelContext) var context
    @Query var allergies: [Allergy]
    @Environment(\.dismiss) var dismiss

    @State var selectedAllergies: Set<UUID> = []
    
    var body: some View {
        NavigationStack {
//            Text("\(allergies)")
            List(allergies) { allergy in
                HStack {
                    Text(allergy.name)
//                    Text(String(allergy.status))
                    Spacer()
                    if selectedAllergies.contains(allergy.id) || allergy.status {
                        Image(systemName: "checkmark")
                            .foregroundColor(.blue)
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    if selectedAllergies.contains(allergy.id) {
                        // If it's already selected, remove it and set status to false
                        selectedAllergies.remove(allergy.id)
                        allergy.status = false
                    } else {
                        // If it's not selected, add it and set status to true
                        selectedAllergies.insert(allergy.id)
                        allergy.status = true
                    }
                }
            }
            .navigationTitle("Select Allergies")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button("Save") {
                do {
                    try context.save()
                } catch {
                    print("Failed to save context: \(error.localizedDescription)")
                }
                dismiss() // Dismiss the view
            })
            .onAppear {
                // Initialize selectedAllergies with the IDs of allergies that are marked as true
                selectedAllergies = Set(allergies.filter { $0.status }.map { $0.id })
            }
        }
    }
}

#Preview {
    InputAllergiesView()/*selectedAllergies: .constant(Set<UUID>([])))*/
}
