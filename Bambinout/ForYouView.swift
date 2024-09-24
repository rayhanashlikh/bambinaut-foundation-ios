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
    @StateObject private var recommended = RecommendationDataModel()
    @Query var babyData: [Baby]
    @Query let ingredients: [Ingredient]
    @State private var showView = false
    
    func filterData(baby: Baby) {
        let ageMonth: Int = baby.getAgeMonth() ?? 0
        let weightStatus = baby.getWeightStatus()
        print("haha\n\(ingredients.count)\n\(ageMonth)\n\(weightStatus)")
        let predicate = #Predicate<Ingredient> { ingredient in
            (ingredient.allergy == nil || ingredient.allergy!.status == false) &&
            ingredient.min_months <= ageMonth &&
            ingredient.max_months >= ageMonth &&
            (ingredient.for_weight_status == 0 ? true : ingredient.for_weight_status == weightStatus)
        }
        
        do {
            try recommended.data = ingredients.filter(predicate)
            print(recommended.data.count)
        } catch {
            print("Error filter")
        }
    }
    var body: some View {
        NavigationStack {
           VStack {
//               for ingredient in ingredients {
//                   Text("\((!ingredient.allergy || !ingredient.allergy!.status))")
//               }
               Text("\(showView)")
               if babyData.first != nil {
                   ForYouCollections(data: $recommended.data, search: recommended.searchText)
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
                   NavigationLink(destination: BabyProfileView(), isActive: $showView) {
                       Button(action: {
                           self.showView = true
                       }, label: {
                           Image(systemName: "person.circle.fill")
                               .resizable()
                               .frame(width: 40, height: 40)
                               .foregroundColor(.black)
                       })
                       
                   }
               }
           }
        }.searchable(text: $recommended.searchText)
            .onDisappear {
                // Reset or refresh any state if necessary
                recommended.data = [] // Clear or reset data if needed
                print("ForYouView disappeared")
            }
        .onAppear(perform: {
            for allergy in recommended.allergies {
                print("\(allergy.name) - \(allergy.status)")
            }
            if (babyData.count == 0) {
                let baby = Baby(
                    latest_weight: 20,
                    latest_weight_date: getDate(date: "2024-10-13"),
                    birth_date: getDate(date: "2024-01-22"),
                    gender: 0,
                    name: "Budi"
                )
                context.insert(baby)
                do {
                    try context.save()
                } catch {
                    print("Failed to save data: \(error)")
                }
            }
            if (babyData.first != nil) {
                print("halo")
                filterData(baby: babyData.first!)
            }
            
        })
    }
}

#Preview {
    ForYouView()
}
