import SwiftUI
import Charts

struct GrowthChartView: View {
    @Binding var month: Int
    var data: [BabyWeight]
    
    var filteredData: [BabyWeight] {
        return data.filter { Calendar.current.component(.month, from: $0.date) == month }
    }
    
    // Menghitung domain untuk x-axis berdasarkan tanggal dalam data yang ada
    var dateDomain: ClosedRange<Date>? {
        guard let minDate = filteredData.map({ $0.date }).min(),
              let maxDate = filteredData.map({ $0.date }).max() else {
            return nil
        }
        return minDate...maxDate
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM" // Format tanggal, bisa disesuaikan
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
            // Ambil tanggal pertama dan terakhir dari data yang sudah difilter
            let lowerBound = filteredData.first?.date ?? Date()
            let upperBound = filteredData.last?.date ?? Date()
            
            Chart {
                ForEach(filteredData) { growth in
                    LineMark(
                        x: .value("Date", growth.date),
                        y: .value("Weight", growth.weight)
                    )
                    
                    RuleMark(x: .value("Date", growth.date))
                        .foregroundStyle(Color.black.opacity(0.7))
                        .lineStyle(StrokeStyle(lineWidth: 0.5, dash: [5, 5]))
                    
                    PointMark(
                        x: .value("Date", growth.date),
                        y: .value("Weight", growth.weight)
                    )
                    .symbol {
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 10, height: 10)
                    }
                    .annotation(position: .top) {
                        Text("\(Int(growth.weight)) kg")
                            .font(.system(size: 12, weight: .medium))
                            .offset(y: -5) // Sesuaikan offset jika perlu
                    }
                }
            }
//                        .chartScrollableAxes(.horizontal)
            //            .chartXScale(domain: dateDomain ?? Date()...Date())
            .chartXScale(domain: lowerBound...upperBound)
            .chartXAxis {
                AxisMarks(values: filteredData.map { $0.date }) { value in
                    if let dateValue = value.as(Date.self) {
                        AxisValueLabel(dateFormatter.string(from: dateValue)) // Menampilkan tanggal dengan format "dd MMM yyyy"
                    }
                    AxisGridLine() // Menampilkan garis grid
                }
            }
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
// Preview untuk menampilkan GrowthChartView
struct GrowthChartView_Previews: PreviewProvider {
    static var previews: some View {
        StatefulPreviewWrapper(8) { monthBinding in
            GrowthChartView(month: monthBinding, data: [
                BabyWeight(date: Calendar.current.date(from: DateComponents(year: 2024, month: 8, day: 7))!, weight: 9),
                BabyWeight(date: Calendar.current.date(from: DateComponents(year: 2024, month: 8, day: 13))!, weight: 11),
                BabyWeight(date: Calendar.current.date(from: DateComponents(year: 2024, month: 8, day: 20))!, weight: 15),
                BabyWeight(date: Calendar.current.date(from: DateComponents(year: 2024, month: 8, day: 25))!, weight: 20),
                BabyWeight(date: Calendar.current.date(from: DateComponents(year: 2024, month: 8, day: 30))!, weight: 15),
                BabyWeight(date: Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 1))!, weight: 20),
                BabyWeight(date: Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 10))!, weight: 17),
                BabyWeight(date: Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 15))!, weight: 18),
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
