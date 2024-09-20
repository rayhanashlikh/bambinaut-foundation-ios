//
//  BambinoutApp.swift
//  Bambinout
//
//  Created by MacBook Air on 12/09/24.
//

import SwiftUI

@main
struct BambinoutApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
