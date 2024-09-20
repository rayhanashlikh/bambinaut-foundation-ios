//
//  ForYouView.swift
//  Bambinout
//
//  Created by MacBook Air on 13/09/24.
//

import SwiftUI
struct ForYouView: View {
    @StateObject private var searchDataModel = SearchDataModel()
    @State var babyData: BabyData? = getDummyBaby()
//    @State var babyData: BabyData? = nil
    var body: some View {
        NavigationStack {
           VStack {
               if let unwrappedBabyData = babyData {
                   ForYouCollections(search: $searchDataModel.searchText, babyData: Binding<BabyData>(
                       get: { unwrappedBabyData },
                       set: { babyData = $0 }
                   ))
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
                   NavigationLink(destination: ProfileView()) {
                       Image(systemName: "person.circle.fill")
                           .resizable()
                           .frame(width: 40, height: 40)
                           .foregroundColor(.black)
                   }
               }
           }
        }.searchable(text: $searchDataModel.searchText)
    }
}

#Preview {
    ForYouView()
}
