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
    @State private var showAlert = false
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
//                    Text("\(currentBaby.first?.name ?? "Kosong")")
//                    Text("\(currentBaby.first?.gender ?? -1)")
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
                        NavigationLink(destination: InputAllergiesView()) {
                            Text("Allergies")
                        }
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
            .alert("Important!", isPresented: $showAlert)
            {
                Button("OK", role: .cancel) {}
            } message: {
                Text("Please enter a name for the baby.")
            }
            .onAppear {
                loadBabyData()
            }
        }
    }
    
    private func saveChanges() {
        var tempCheck = currentBaby.first?.name ?? nil
        
        let existingBaby = currentBaby.first
        
        if babyName.isEmpty {
            showAlert = true // Show alert if babyName is empty
        } else {
            let gender = (selectedGender == .female) ? 1 : 0
            
            if let baby = existingBaby {
                // Update existing baby
                baby.name = babyName
                baby.gender = gender
                baby.birth_date = birthDate
                
                // Save changes
                do {
                    try context.save()
                } catch {
                    print(error.localizedDescription)
                }
            } else {
                // Create new baby if none exists
                let inpBaby = Baby(latest_weight: 10.0, latest_weight_date: Date(), birth_date: birthDate, gender: gender, name: babyName)
                context.insert(inpBaby)
                
                // Save new baby
                do {
                    try context.save()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    private func fetchAllergies(for selectedIDs: Set<UUID>) -> [Allergy] {
        return allergies.filter { selectedIDs.contains($0.id) }
    }
    
    private func loadBabyData() {
        var tempCheck = currentBaby.first?.name ?? nil
        
        if tempCheck != nil{
            var babyExist = currentBaby.first
            
            babyName = babyExist!.name
            birthDate = babyExist?.birth_date ?? Date()
            selectedGender = babyExist?.gender == 1 ? .female : .male
        }
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
