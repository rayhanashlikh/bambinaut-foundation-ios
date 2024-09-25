//
//  BabyWeight.swift
//  Bambinout
//
//  Created by MacBook Air on 24/09/24.
//

import Foundation
import SwiftData

@Model
class BabyWeight: Identifiable {
    var id: UUID
    var date: Date
    var weight: Double
    
    init (date: Date, weight: Double) {
        self.id = UUID()
        self.date = date
        self.weight = weight
    }
    
    static func inputBabyWeight(date: Date, weight: Double, modelContext: ModelContext) {
        // Buat instance BabyWeight baru
        let newBabyWeight = BabyWeight(date: date, weight: weight)
        
        // Masukkan data ke dalam konteks
        modelContext.insert(newBabyWeight)
        
        // Simpan perubahan dalam konteks
        do {
            try modelContext.save()
            print("Baby weight saved successfully")
        } catch {
            print("Failed to save baby weight: \(error.localizedDescription)")
        }
    }
    
    // Fungsi untuk memformat latest_weight_date
    func formattedLatestWeightDate() -> String {
        let date = date
        
        let formatter = DateFormatter()
        formatter.dateStyle = .long // Format "11 August 2024"
        return formatter.string(from: date)
    }
}
