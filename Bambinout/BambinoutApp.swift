//
//  BambinoutApp.swift
//  Bambinout
//
//  Created by MacBook Air on 12/09/24.
//

import SwiftUI
import SwiftData

@main
struct BambinoutApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [
            Ingredient.self,
            Allergy.self,
            Nutrition.self,
            Baby.self,
            BabyWeight.self,
        ])
        
    }
}
