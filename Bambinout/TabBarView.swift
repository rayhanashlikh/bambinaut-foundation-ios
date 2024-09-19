//
//  SwiftUIView.swift
//  bambinaut-foundation-ios
//
//  Created by MacBook Air on 13/09/24.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
            TabView {
                ForYouView()
                    .tabItem {
                        Image(systemName: "hand.thumbsup")
                        Text("For You")
                    }
                TrackerView()
                    .tabItem {
                        Image(systemName: "chart.bar.xaxis")
                        Text("Tracker")
                    }
                IngredientsView()
                    .tabItem {
                        Image(systemName: "carrot")
                        Text("Ingredients")
                    }
            }
        
    }
}

#Preview {
    TabBarView()
}
