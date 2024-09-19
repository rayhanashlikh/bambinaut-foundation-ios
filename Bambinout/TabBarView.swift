//
//  SwiftUIView.swift
//  bambinaut-foundation-ios
//
//  Created by MacBook Air on 13/09/24.
//

import SwiftUI

struct TabBarView: View {
    // Configure the appearance of the TabBar in the init method
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: "tabbar-bg-blue") // Use the custom color
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance // For handling scroll edge appearance in iOS 15+
    }
    
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
