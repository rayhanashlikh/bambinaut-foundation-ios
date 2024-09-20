import SwiftUI

struct TrackerView: View {
    @State private var presented = false
    @State private var tracker = false
    @State private var selectedMonth: String = "January"
    @State private var babyStatus: Int = 1
    
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
                        
                        Spacer()
                        
                        ScrollView {
                            HStack {
                                Text("Last Input: x Days ago")
                                    .padding([.leading, .trailing])
                                    .foregroundColor(Color(.tertiaryLabel))
                                Spacer()
                            }
                            
                            MonthPickerView(selectedMonth: $selectedMonth)
                            GrowthChartView()
                            
                            HStack {
                                Text("Baby's name is on:")
                                    .padding([.leading, .trailing])
                                Spacer()
                            }
                            
                            babyStatus(status: babyStatus)
                            
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
                            NavigationLink(destination: ProfileView().toolbar(.hidden, for: .tabBar)) {
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
                .background(Color("background-blue"))
            }
        }
    }
    
    func babyStatus(status: Int) -> some View {
        let statusText: String
        let textColor: Color
        
        switch status {
        case 0:
            statusText = "Underweight"
            textColor = Color("yellow-text")
        case 1:
            statusText = "Ideal Weight"
            textColor = Color("green-text")
        case 2:
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
