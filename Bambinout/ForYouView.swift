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
    @Query let babyData: [Baby]
    @Query let ingredients: [Ingredient]
    @Query let babyWeight: [BabyWeight]
    @State var babyLatestWeight: Double = 7
    
    func filterData(baby: Baby, weight: Double) {
        let ageMonth: Int = baby.getAgeMonth() ?? 0
        let weightStatus = baby.getWeightStatus(latest_weight: weight)
        print("haha\n\(ingredients.count)\n\(ageMonth)\n\(weightStatus)")
        let predicate = #Predicate<Ingredient> { ingredient in
            (ingredient.allergy == nil || ingredient.allergy!.status == false) &&
            ingredient.min_months <= ageMonth &&
            ingredient.max_months >= ageMonth &&
            (ingredient.for_weight_status == 0 ? true : ingredient.for_weight_status == weightStatus)
        }
        
        do {
            try recommended.data = ingredients.filter(predicate)
            print("recommended: \(recommended.data.count)")
        } catch {
            print("Error filter")
        }
    }
    var body: some View {
        NavigationStack {
           VStack {
               if babyData.first != nil {
                   if (recommended.data.count > 0) {
                       
                       ForYouCollections(data: $recommended.data, search: recommended.searchText)
                   } else {
                       VStack {
                           HStack {
                               Image(systemName: "info.circle")
                               Text("No recommended ingredients for your baby").font(.caption).multilineTextAlignment(.leading)
                           }.foregroundColor(.gray)
                       }.padding(.horizontal, 20)
                   }
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
           .navigationBarTitleDisplayMode(.large)
           .toolbar() {
               ToolbarItem(placement: .navigationBarLeading) {
                   VStack {
                       Spacer()
                       Text("For You")
                           .font(.largeTitle)
                           .bold()
                   }
               }
               ToolbarItem(placement: .topBarTrailing) {
                   NavigationLink(destination: BabyProfileView(), isActive: $recommended.isShowNav) {
                       Button(action: {
                           recommended.isShowNav = true
                       }, label: {
                           Image(systemName: "person.circle.fill")
                               .resizable()
                               .frame(width: 33, height: 33)
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
        .onReceive(recommended.$isShowNav, perform: { _ in
            babyLatestWeight = babyWeight.last?.weight ?? 7
            
            if (babyData.first != nil) {
                filterData(baby: babyData.first!, weight: babyLatestWeight)
            }
        })
        .onAppear(perform: {
            babyLatestWeight = babyWeight.last?.weight ?? 7
            
            if (babyData.first != nil) {
                filterData(baby: babyData.first!, weight: babyLatestWeight)
            }
            
        })
    }
}

#Preview {
    ForYouView()
}
