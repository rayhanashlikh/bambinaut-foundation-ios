//
//  WeightInfoView.swift
//  Bambinout
//
//  Created by MacBook Air on 19/09/24.
//

import SwiftUI

struct BabyWeightDataModel: Identifiable {
    var id = UUID()
    var gender: Int // 1 for female, 0 for male
    var age: Int // in months
    var weight: String // range weight
    
    init(gender: Int, age: Int, weight: String) {
        self.gender = gender
        self.age = age
        self.weight = weight
    }
}

struct WeightInfoView: View {
    @Environment(\.dismiss) var dismiss // To dismiss the view
    @State private var gender: Int = 0
    @State private var tabBarVisible: Bool = false
    
    var data: [BabyWeightDataModel] = [
        BabyWeightDataModel(gender: 0, age: 6, weight: "6.4 - 8.8 kg"),
        BabyWeightDataModel(gender: 0, age: 7, weight: "6.7 - 9.2 kg"),
        BabyWeightDataModel(gender: 0, age: 8, weight: "6.9 - 9.6 kg"),
        BabyWeightDataModel(gender: 0, age: 9, weight: "7.1 - 9.9 kg"),
        BabyWeightDataModel(gender: 0, age: 10, weight: "7.4 - 10.2 kg"),
        BabyWeightDataModel(gender: 0, age: 11, weight: "7.6 - 10.5 kg"),
        BabyWeightDataModel(gender: 0, age: 12, weight: "7.7 - 10.8 kg"),
        BabyWeightDataModel(gender: 1, age: 6, weight: "5.7 - 8.2 kg"),
        BabyWeightDataModel(gender: 1, age: 7, weight: "6.0 - 8.6 kg"),
        BabyWeightDataModel(gender: 1, age: 8, weight: "6.3 - 9.0 kg"),
        BabyWeightDataModel(gender: 1, age: 9, weight: "6.5 - 9.3 kg"),
        BabyWeightDataModel(gender: 1, age: 10, weight: "6.7 - 9.6 kg"),
        BabyWeightDataModel(gender: 1, age: 11, weight: "6.9 - 9.9 kg"),
        BabyWeightDataModel(gender: 1, age: 12, weight: "7.0 - 10.1 kg"),
    ]
    
    // Filter data berdasarkan gender
    var filteredData: [BabyWeightDataModel] {
        return data.filter { $0.gender == gender }
    }
    
    var body: some View {
        ZStack {
            Color("background-blue")
                .edgesIgnoringSafeArea(.bottom)// Atur background secara global
            
            VStack {
                Picker("Pick your baby's gender", selection: $gender) {
                    Text("Male").tag(0)
                    Text("Female").tag(1)
                }
                .padding()
                .pickerStyle(.segmented)
                
                List(filteredData) {item in
                    HStack {
                        Text("\(item.age) months")
                            .font(.title3)
                            .fontWeight(.bold)
                        Spacer()
                        Text("\(item.weight)")
                    }
                    .padding(.vertical, 7)
                    .background(
                        Color.white
                    )
                }
                .padding([.horizontal])
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
                
                Spacer()
            }
        }
        .navigationTitle("Ideal Weight Info")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left") // Back icon
                        Text("Tracker") // Custom back button text
                    }
                }
            }
        }
    }
}

#Preview {
    WeightInfoView()
}
