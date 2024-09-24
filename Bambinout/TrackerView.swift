import SwiftUI

struct TrackerView: View {
    @State private var presented = false
    @State private var tracker = false
    @State private var selectedMonth: String = "January"
    @State private var month: Int = 8
    
    let babyData = getDummyBaby()
    
    private static let monthNames: [String: Int] = [
        "January": 1, "February": 2, "March": 3, "April": 4, "May": 5, "June": 6,
        "July": 7, "August": 8, "September": 9, "October": 10, "November": 11, "December": 12
    ]
    
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
                            HStack {
                                Text("Last Input: \(babyData.formattedLatestWeightDate())")
                                    .padding([.leading, .trailing])
                                    .foregroundColor(Color(.tertiaryLabel))
                                Spacer()
                            }
                            
                            MonthPickerView(selectedMonth: $selectedMonth)
                            GrowthChartView(month: $month, data: [
                                BabyGrowth(day: 7, month: 8, year: 2024, weight: 9),
                                BabyGrowth(day: 13, month: 8, year: 2024, weight: 11),
                                BabyGrowth(day: 19, month: 8, year: 2024, weight: 15),
                                BabyGrowth(day: 25, month: 8, year: 2024, weight: 20),
                                BabyGrowth(day: 30, month: 8, year: 2024, weight: 15),
                                BabyGrowth(day: 1, month: 9, year: 2024, weight: 20),
                                BabyGrowth(day: 10, month: 9, year: 2024, weight: 17),
                                BabyGrowth(day: 15, month: 9, year: 2024, weight: 18),
                            ])
                            
                            HStack {
                                Text("Your baby, \(babyData.name) is currently: ")
                                    .padding([.leading, .trailing])
                                Spacer()
                            }
                            
                            babyStatus(status: babyData.getWeightStatus())
                            
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
                                .padding([.leading, .trailing])
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
            statusText = ""
            textColor = .black
        }
        
        return Text(statusText)
            .font(.largeTitle)
            .foregroundColor(textColor)
            .bold()
            .underline()
            .padding()
    }
}

#Preview {
    TrackerView()
}
