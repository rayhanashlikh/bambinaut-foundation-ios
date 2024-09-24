//
//  Baby.swift
//  Bambinout
//
//  Created by MacBook Air on 23/09/24.
//

import Foundation
import SwiftData

@Model
class Baby: Identifiable {
    var id: UUID
    var latest_weight: Double
    var latest_weight_date: Date?
    var birth_date: Date?
    var gender: Int // 0 = female; 1 = male
    
//    @Relationship(inverse: \Allergy.babies)
//    var allergies: [Allergy]
    
    init(latest_weight: Double, latest_weight_date: Date? = nil, birth_date: Date? = nil, gender: Int) {
        self.id = UUID()
//        self.allergies = allergies
        self.latest_weight = latest_weight
        self.latest_weight_date = latest_weight_date
        self.birth_date = birth_date
        self.gender = gender
    }
    
    //mendapatkan umur bayi dalam bulan berdasarkan tanggal lahir
    func getAgeMonth() -> Int? {
        let calendar = Calendar.current
        let current = Date()
        guard self.birth_date ?? current <= current else {
            return nil
        }
        
        let components = calendar.dateComponents([.month], from: self.birth_date ?? current, to: current)
        return components.month
    }
    
    //mendapatkan status berat badan bayi
    //-1 = underweight; 0 = normal; 1 = overweight
    func getWeightStatus() -> Int {
        if (self.latest_weight >= getBabyOptimalWeightRange(age: self.getAgeMonth() ?? 0, gender: self.gender).max) {
            return 1
        } else if (self.latest_weight <= getBabyOptimalWeightRange(age: self.getAgeMonth() ?? 0, gender: self.gender).min) {
            return -1
        } else {
            return 0
        }
    }
}
