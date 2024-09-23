//
//  GrowthChartView.swift
//  Bambinout
//
//  Created by MacBook Air on 18/09/24.
//

import SwiftUI
import Charts

struct GrowthChartView: View {
    var data: [BabyGrowth] = [
        BabyGrowth(day: 7, month: 8, year: 2024, weight: 9),
        BabyGrowth(day: 13, month: 8, year: 2024, weight: 11),
        BabyGrowth(day: 19, month: 8, year: 2024, weight: 15),
        BabyGrowth(day: 25, month: 8, year: 2024, weight: 20),
        BabyGrowth(day: 29, month: 8, year: 2024, weight: 18),
    ]
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short // Format tanggal, bisa disesuaikan
        return formatter
    }
    
    var body: some View {
        HStack {
            Text("Baby Growth Data")
            Spacer()
        }
        .padding([.leading, .trailing, .top])
        
        Chart(data) {
            LineMark (
                x: .value("Date", $0.date),
                y: .value("Baby Weight", $0.weight)
            )
        }
        .chartXAxis {
            AxisMarks(preset: .aligned, values: data.map { $0.date }) { value in
                if let dateValue = value.as(Date.self) {
                    // Custom format to display month and year
                    AxisValueLabel(dateValue.formatted(.dateTime.month(.abbreviated).year()))
                }
            }
        }
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)))
        .frame(maxWidth: .infinity, maxHeight: 300)
        .background(.white)
        .padding([.leading, .trailing, .bottom])
    }
}

struct BabyGrowth: Identifiable {
    var id = UUID()
    var date: Date
    var weight: Double
    
    init(day: Int, month: Int, year: Int, weight: Double) {
        let calendar = Calendar.autoupdatingCurrent
        self.date = calendar.date(from: DateComponents(year: year, month: month, day: day))!
        self.weight = weight
    }
}

// Preview untuk menampilkan ContentView
#Preview {
    GrowthChartView()
}
