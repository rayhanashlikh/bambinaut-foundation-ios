//
//  SplashScreen.swift
//  Bambinout
//
//  Created by MacBook Air on 23/09/24.
//

import SwiftUI

struct SplashScreen: View {
    @State var isActive: Bool = false
    
    var body: some View {
        ZStack {
            if self.isActive {
                TabBarView()
            } else {
                Color(red: 173/255, green: 216/255, blue: 230/255) // Baby blue color
                    .edgesIgnoringSafeArea(.all)
                Image("bambinaut")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300,height: 180)
            }
        }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
    }
}

#Preview {
    SplashScreen()
}
