import SwiftUI
import Charts

struct GrowthChartView: View {
    @Binding var month: Int
    var data: [BabyGrowth]
    
    var filteredData: [BabyGrowth] {
        return data.filter { Calendar.current.component(.month, from: $0.date) == month }
    }
    
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
        
        if filteredData.isEmpty {
            // Menampilkan pesan error ketika tidak ada data untuk bulan tersebut
            Text("The data for this month is not yet available")
                .foregroundColor(.red)
                .padding()
                .background(Color.tabbarBgBlue)
                .cornerRadius(10)
        } else {
            Chart {
                ForEach(filteredData) { growth in
                    LineMark(
                        x: .value("Date", growth.date),
                        y: .value("Weight", growth.weight)
                    )
                    .symbol {
                        Circle()
                            .fill(.blue)
                            .frame(width: 5, height: 5)
//                            .offset(y: 0)
                    }
                    .annotation(position: .top) {
                        Text("\(Int(growth.weight))")
                            .font(.system(size: 8, weight: .medium))
                            .offset(y: -5) // Sesuaikan offset jika perlu
                    }                }
            }
//            .chartXAxis {
//                AxisMarks(values: .stride(by: 1)) { value in
//                    if let date = value.as(Date.self) {
//                        let formatter = DateFormatter()
//                        formatter.dateFormat = "dd" // Format untuk menampilkan hari
//                        let dayString = formatter.string(from: date)
//                        AxisValueLabel(dayString)
//                    }
//                }
//            }
//            .chartScrollableAxes(.horizontal)
//            .chartXVisibleDomain(length: 3600 * 24 * 30)
            .padding()
            .frame(height: 300)
            .background(Color.tabbarBgBlue)
            .cornerRadius(10)
            .padding()
            
        }
        Spacer()
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

// Preview untuk menampilkan GrowthChartView
struct GrowthChartView_Previews: PreviewProvider {
    static var previews: some View {
        StatefulPreviewWrapper(8) { monthBinding in
            GrowthChartView(month: monthBinding, data: [
                BabyGrowth(day: 7, month: 8, year: 2024, weight: 9),
                BabyGrowth(day: 13, month: 8, year: 2024, weight: 11),
                BabyGrowth(day: 16, month: 8, year: 2024, weight: 15),
                BabyGrowth(day: 25, month: 8, year: 2024, weight: 20),
                BabyGrowth(day: 30, month: 8, year: 2024, weight: 15),
                BabyGrowth(day: 1, month: 9, year: 2024, weight: 20),
                BabyGrowth(day: 10, month: 9, year: 2024, weight: 17),
                BabyGrowth(day: 15, month: 9, year: 2024, weight: 18),
            ])
        }
    }
}

// Helper struct to create a @State wrapper for preview
struct StatefulPreviewWrapper<T: Equatable, Content: View>: View {
    @State private var value: T
    private var content: (Binding<T>) -> Content

    init(_ initialValue: T, content: @escaping (Binding<T>) -> Content) {
        self._value = State(wrappedValue: initialValue)
        self.content = content
    }

    var body: some View {
        content($value)
    }
}
