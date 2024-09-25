//
//  SplashScreen.swift
//  Bambinout
//
//  Created by MacBook Air on 23/09/24.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        ZStack {
            Color(red: 173/255, green: 216/255, blue: 230/255) // Baby blue color
                           .edgesIgnoringSafeArea(.all)
            Image("bambinaut")
                .resizable()
                .scaledToFill()
                .frame(width: 300,height: 180)
            
            
        }
    }
}

#Preview {
    SplashScreen()
}
