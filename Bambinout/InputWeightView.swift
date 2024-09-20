import SwiftUI

struct InputWeightView: View {
    @Environment(\.dismiss) var dismiss // To dismiss the view
    @State var weight: String = ""
    @State private var birthDate = Date()
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "navigation-blue")
        
        // Apply the appearance settings
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        ZStack {
            Color("background-blue") // Atur background secara global
                .edgesIgnoringSafeArea(.bottom)
            
            Form {
                Section {
                    HStack {
                        Text("Date")
                        Spacer()
                        DatePicker("", selection: $birthDate, displayedComponents: .date)
                            .labelsHidden()
                            .frame(width: 200, alignment: .trailing)
                    }
                    HStack {
                        Text("Weight")
                        HStack {
                            TextField("Enter weight", text: $weight)
                                .keyboardType(.decimalPad) // Membatasi input hanya angka dan desimal
                                .frame(width: 100)
                                .padding(.leading)
                            Spacer()
                            Text("kg") // Petunjuk satuan di sebelah kanan TextField
                                .foregroundColor(.gray)
                            }
                    }
                } header: {
                    Text("Input weight")
                }
            }
            .scrollContentBackground(.hidden) // Menyembunyikan background bawaan dari form
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left") // Back icon
                        Text("Cancel") // Custom back button text
                    }
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    print("Done button clicked, weight: \(weight)")
                }) {
                    Text("Done")
                }
            }
        }
        .navigationTitle("Input Baby Weight")
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    InputWeightView()
}
