//
//  DataController.swift
//  Bambinout
//
//  Created by MacBook Air on 20/09/24.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "bambinaut")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
    
    func createInitialNutritionData() {
        let context = container.viewContext
                
        // Create your entities
        for i in 1...10 {
            let newEntity = Nutritions(
                context: context
            )
            newEntity.name = "Tomato"
            // Set other attributes as needed
        }
        
        // Save context
        do {
            try context.save()
            print("Initial data created successfully.")
        } catch {
            print("Failed to save initial data: \(error)")
        }
    }
}
