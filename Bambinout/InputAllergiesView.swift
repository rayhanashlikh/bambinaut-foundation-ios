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
    @Query var allergies: [Allergy] // Fetch allergies from Core Data
    @Binding var selectedAllergies: Set<UUID>
//    var onDone: (Set<UUID>) -> Void // Closure to pass data
    @Environment(\.dismiss) var dismiss

//    @State var selectedAllergies: Set<UUID> = []
    
//    struct Allergies: Identifiable {
//        let name: String
//    //    let allergyIcon : String
//        let id = UUID()
//    }
//    
//    
//    var allergyList = [
//            Allergies(name: "Seafood"),
//            Allergies(name: "Dairy"),
//            Allergies(name: "Peanut"),
//            Allergies(name: "Soy"),
//            Allergies(name: "Egg")
//    ]
    
    var body: some View {
        NavigationStack {
            List(allergies) { allergy in
                HStack {
                    Text(allergy.name ?? "Unknown") // Ensure name is not nil
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
            }
            .navigationTitle("Select Allergies")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button("Done") {
                dismiss()
            })
        }
    }
}

#Preview {
    InputAllergiesView(selectedAllergies: .constant(Set<UUID>([])))
}
