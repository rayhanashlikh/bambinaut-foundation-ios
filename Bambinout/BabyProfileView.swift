//
//  BabyProfileView.swift
//  Bambinout
//
//  Created by MacBook Air on 17/09/24.
//

import SwiftUI

struct BabyProfileView: View {
    @State var babyName = ""
    @State private var birthDate = Date()
    
    @State private var selectedGender: Gender = .male
    enum Gender : String, CaseIterable, Identifiable {
        case male, female
        var id: Self { self }
    }

    var body: some View {
        
        VStack {
            NavigationStack {
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
                        VStack {
                            Picker("Gender", selection: $selectedGender) {
                                ForEach(Gender.allCases) { gender in
                                    Text(gender.rawValue.capitalized)
                                }
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
                        NavigationLink (
                            destination : InputAllergiesView()
                        ) {
                            Text("Allergies")
                        }
                        
                        
                    }
                }.navigationTitle("Baby Profile").navigationBarTitleDisplayMode(.inline)
                
            }
        }
    }
}

#Preview {
    BabyProfileView()
}
