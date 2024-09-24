//
//  ForYouView.swift
//  Bambinout
//
//  Created by MacBook Air on 13/09/24.
//

import SwiftUI
import SwiftData
struct ForYouView: View {
    @Environment(\.modelContext) private var context
    @State private var search: String = ""
    @Query var babyData: [Baby]
    @Query let ingredients: [Ingredient]
//    @State var babyData: BabyData? = nil
    //            !babyData.allergy_ids.contains($0.allergy_id ?? 0) &&
    //            babyData.getAgeMonth() ?? 0 >= $0.min_months &&
    //            babyData.getAgeMonth() ?? 0 <= $0.max_months &&
    //            (babyData.getWeightStatus() != 0 ? $0.for_weight_status == babyData.getWeightStatus() : true)
    var filteredData: [Ingredient] = []
    
    mutating func filterData(baby: Baby, search: String) {
        let ageMonth: Int = baby.getAgeMonth() ?? 0
        let weightStatus = baby.getWeightStatus()
        
        let predicate = #Predicate<Ingredient> { ingredient in
            ((ingredient.allergy?.status) != nil) &&
            ingredient.min_months <= ageMonth &&
            ingredient.max_months >= ageMonth &&
            weightStatus != 0 ? ingredient.for_weight_status == weightStatus : true &&
            ingredient.name.localizedStandardContains(search)
        }
        
        do {
            try filteredData = ingredients.filter(predicate)
        } catch {
            print("Error filter")
        }
    }
    init() {
        if (babyData.count == 0) {
            let baby = Baby(
                latest_weight: 20,
                latest_weight_date: getDate(date: "2024-10-13"),
                birth_date: getDate(date: "2024-01-22"),
                gender: 0,
                name: "Budi"
            )
        }
        do {
            try context.save()
        } catch {
            print("Failed to save data: \(error)")
        }
        if (babyData.first != nil) {
            filterData(baby: babyData.first!, search: search)
        }
    }
    var body: some View {
        NavigationStack {
           VStack {
               ForEach(filteredData, id: \.self) { ing in
                   Text(ing.name)
               }
               if babyData.first != nil {
                   ForYouCollections(search: search, babyData: babyData.first!
                   )
               } else {
                   VStack {
                       NavigationLink(destination: BabyProfileView()) {
                           HStack {
                               Text("Go to baby profile")
                                   .font(.headline)
                                   .frame(maxWidth: .infinity)
                                   .padding()
                                   .background(Color.yellow)
                                   .cornerRadius(8)
                           }
                       }
                       HStack {
                           Image(systemName: "info.circle")
                           Text("Please fill your baby’s profile to get personalized food recommendation for your baby").font(.caption).multilineTextAlignment(.leading)
                           Spacer()
                       }.foregroundColor(.gray)
                   }.padding(.horizontal, 20)
               }
           }
           .navigationTitle("For You")
           .toolbar() {
               ToolbarItem(placement: .topBarTrailing) {
                   NavigationLink(destination: BabyProfileView()) {
                       Image(systemName: "person.circle.fill")
                           .resizable()
                           .frame(width: 40, height: 40)
                           .foregroundColor(.black)
                   }
               }
           }
        }.searchable(text: $search)
    }
}

#Preview {
    ForYouView()
}
