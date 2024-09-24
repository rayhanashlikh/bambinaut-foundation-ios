import SwiftUI

struct MonthPickerView: View {
    @Binding var selectedMonth: String
    @State private var showingPicker = false
    
    let months = [
        "January", "February", "March", "April", "May", "June",
        "July", "August", "September", "October", "November", "December"
    ]
    
    var body: some View {
        VStack {
            // Button untuk membuka picker
            Button(action: {
                showingPicker = true
            }) {
                HStack {
                    Text("Select Month")
                    Spacer()
                    Text(selectedMonth)
                        .padding(8)
                        .foregroundColor(.blue)
                        .background(Color("tertiary"))
                        .cornerRadius(8)
                }
                .padding([.leading, .trailing], 10)
                .padding([.top, .bottom], 10)
                .background(Color.tabbarBgBlue)
                .cornerRadius(8)
            }
            .sheet(isPresented: $showingPicker) {
                NavigationView {
                    VStack {
                        Picker("Select Month", selection: $selectedMonth) {
                            ForEach(months, id: \.self) { month in
                                Text(month).tag(month)
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                        .padding()
                        
                        Spacer()
                    }
                    .background(Color.tabbarBgBlue)
                    .navigationTitle("Pick a Month")
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                showingPicker = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                showingPicker = false
                            }
                        }
                    }
                }
            }
        }
        .padding(.trailing)
        .padding(.leading)
    }
}

struct MonthPickerView_Previews: PreviewProvider {
    static var previews: some View {
        StatePreview()
    }
    
    struct StatePreview: View {
        @State private var selectedMonth = "January"
        
        var body: some View {
            MonthPickerView(selectedMonth: Binding(
                get: { selectedMonth },
                set: { selectedMonth = $0 }
            ))
                .previewLayout(.sizeThatFits) // Adjust preview layout as needed
        }
    }
}
