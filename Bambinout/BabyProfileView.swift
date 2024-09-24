//
//  BabyProfileView.swift
//  Bambinout
//
//  Created by MacBook Air on 17/09/24.
//

import SwiftUI
import SwiftData
import CoreData


struct BabyProfileView: View {
    @State var babyName = ""
    @State var birthDate = Date()
    @State private var selectedGender: Gender = .male
    
    @State private var selectedAllergies: Set<UUID> = []
    @Query var allergies : [Allergy]
    @Query var currentBaby : [Baby]
    
    var babyID: UUID?
    
    enum Gender: String, CaseIterable, Identifiable {
        case male, female
        var id: Self { self }
    }
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context

    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "figure.child.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                Form {
                    HStack {
                        Text("Baby Name")
                        TextField(text: $babyName, prompt: Text("Baby Name")) {
                            Text("Baby Name")
                        }.multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("Gender")
                        Spacer()
                        Picker("Gender", selection: $selectedGender) {
                            ForEach(Gender.allCases) { gender in
                                Text(gender.rawValue.capitalized)
                            }
                        }
                        .pickerStyle(.segmented).frame(width: 200, alignment: .trailing)
                    }
                    HStack {
                        Text("Birth Date")
                        Spacer()
                        DatePicker("", selection: $birthDate, displayedComponents: .date)
                            .labelsHidden()
                            .frame(width: 200, alignment: .trailing)
                    }
                    HStack {
                        NavigationLink(destination: InputAllergiesView(selectedAllergies: $selectedAllergies)) {
                                Text("Allergies")
                            }
                            .buttonStyle(PlainButtonStyle())
//                        NavigationLink(destination: InputAllergiesView()) {
//                            Text("Allergies")
//                        }
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .background(.tabbarBgBlue)
            .navigationTitle("Baby Profile")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button("Save") {
                saveChanges()
            })
            .onAppear {
                loadBabyData()
            }
        }
    }
    
    private func saveChanges() {
        let gender = (selectedGender == .female) ? 1 : 0
        
        let inpAllergies: [Allergy] = fetchAllergies(for: selectedAllergies)
        
        let inpBaby = Baby( latest_weight: 10.0, latest_weight_date: Date(), birth_date: birthDate, gender: gender, name: babyName)
            context.insert(inpBaby)

            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
            dismiss()
    }
    
    private func fetchAllergies(for selectedIDs: Set<UUID>) -> [Allergy] {
        return allergies.filter { selectedIDs.contains($0.id) } // Filter allergies based on selectedIDs
    }
    
    private func loadBabyData() {
        
    }

//    private func fetchBaby(by id: UUID) -> Baby? {
//        // Fetch the baby from the context using the provided ID
//        // Replace this with your actual fetch implementation
//        return nil
//    }

}


#Preview {
    BabyProfileView()
}
