import SwiftUI
import SwiftData

struct TrackerView: View {
    @State private var presented = false
    @State private var tracker = false
    @State var selectedMonth: String = "September"
    @State private var month: Int = 8
    @State private var latestDate: Date?
    @State private var latestWeight: Double?
    
    let babyData = getDummyBaby()
    
    @Query var baby: [Baby]
    @Query var babyWeight: [BabyWeight]
    
    static let monthNames: [String: Int] = [
        "January": 1, "February": 2, "March": 3, "April": 4, "May": 5, "June": 6,
        "July": 7, "August": 8, "September": 9, "October": 10, "November": 11, "December": 12
    ]
    
    var filteredBabyWeight: [BabyWeight] {
        return babyWeight.filter { Calendar.current.component(.month, from: $0.date) == month }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    VStack {
                        NavigationLink(destination: InputWeightView().toolbar(.hidden, for: .tabBar)) {
                            HStack {
                                Image(systemName: "plus")
                                Text("Input Weight")
                                Spacer()
                            }
                        }
                        .padding()
                        .background(Color("navigation-blue"))
                        
                        Spacer()
                        
                        ScrollView {
                            if baby.first != nil {
                                HStack {
                                    Text("Last Input: \(babyWeight.last?.formattedLatestWeightDate() ?? "No data")")
                                        .padding([.leading, .trailing])
                                        .foregroundColor(Color(.tertiaryLabel))
                                    Spacer()
                                }
                                
                                MonthPickerView(selectedMonth: $selectedMonth)
                                GrowthChartView(month: $month, data: filteredBabyWeight)
                                
                                HStack {
                                    Text("Your baby, \(baby.first?.name ?? "") is currently: ")
                                        .padding([.leading, .trailing])
                                    Spacer()
                                }
                                
                                babyStatus(status: baby.first?.getWeightStatus(latest_weight: latestWeight ?? 7) ?? 3)
                                
                                HStack {
                                    NavigationLink(destination: WeightInfoView().toolbar(.hidden, for: .tabBar)) {
                                        HStack {
                                            Spacer()
                                            Image(systemName: "info.circle")
                                                .foregroundStyle(Color.black)
                                            Text("More info")
                                                .foregroundStyle(Color.black)
                                            Spacer()
                                        }
                                        .padding()
                                        .background(Color("button-color"))
                                        .cornerRadius(10)
                                        .shadow(radius: 5, y: 9)
                                    }
                                    .padding([.leading, .trailing, .bottom])
                                    Spacer()
                                }
                            } else {
                                VStack {
                                    NavigationLink(destination: BabyProfileView().toolbar(.hidden, for: .tabBar)) {
                                        HStack {
                                            Text("Go to baby profile")
                                                .font(.headline)
                                                .frame(maxWidth: .infinity)
                                                .padding()
                                                .background(Color.yellow)
                                                .cornerRadius(8)
                                        }
                                    }
                                    HStack {
                                        Image(systemName: "info.circle")
                                        Text("Please fill your baby’s profile to get your baby growth and weight tracker").font(.caption).multilineTextAlignment(.leading)
                                        Spacer()
                                    }.foregroundColor(.gray)
                                }.padding(.horizontal, 20)
                            }
                        }
                        .scrollBounceBehavior(.basedOnSize, axes: [.vertical])
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Text("Tracker")
                                .font(.largeTitle)
                                .bold()
                        }
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            NavigationLink(destination: BabyProfileView().toolbar(.hidden, for: .tabBar)) {
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .frame(width: 33, height: 33)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
                .background(Color("background-blue"))
            }
            .onChange(of: selectedMonth, initial: false) { _, newValue in
                updateMonthFromSelectedMonth(newValue: newValue)
            }
            .onAppear {
                latestDate = babyWeight.last?.date ?? Date.now
                let extractedLatestDate = extractDayMonthYearFromDate(date: latestDate ?? Date.now)
                month = extractedLatestDate.month
                let monthName = monthName(from: month)
                updateMonthFromSelectedMonth(newValue: monthName)
                latestWeight = babyWeight.last?.weight ?? 7.0
            }
        }
    }
    
    func updateMonthFromSelectedMonth(newValue: String) {
        if let newMonth = TrackerView.monthNames[newValue] {
            month = newMonth
        }
    }
    
    func babyStatus(status: Int) -> some View {
        let statusText: String
        let textColor: Color
        
        switch status {
        case -1:
            statusText = "Underweight"
            textColor = Color("red-text")
        case 0:
            statusText = "Ideal Weight"
            textColor = Color("green-text")
        case 1:
            statusText = "Overweight"
            textColor = Color("red-text")
        default:
            statusText = "No data"
            textColor = .black
        }
        
        return Text(statusText)
            .font(.largeTitle)
            .foregroundColor(textColor)
            .bold()
            .underline()
            .padding()
    }
    
    func dateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        
        return formatter.string(from: date)
    }
    
    func extractDayMonthYearFromDate(date: Date) -> (day: Int, month: Int, year: Int) {
        let calendar = Calendar.current
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        let year = calendar.component(.year, from: date)
        
        return (day, month, year)
    }
    
    func monthName(from monthNumber: Int) -> String {
        let dateFormatter = DateFormatter()
        let months = dateFormatter.monthSymbols // Array of month names
        
        // Pastikan angka bulan valid (1 - 12)
        guard monthNumber >= 1 && monthNumber <= 12 else {
            return "Invalid month"
        }
        
        return months?[monthNumber - 1] ?? "October" // -1 karena index array mulai dari 0
    }
}

#Preview {
    TrackerView(selectedMonth: "October")
}
