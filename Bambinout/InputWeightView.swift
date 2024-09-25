import SwiftUI
import SwiftData

struct InputWeightView: View {
    @Environment(\.dismiss) var dismiss // To dismiss the view
    @Environment(\.modelContext) var modelContext
    
    @State var weight: String = ""
    @State private var birthDate = Date()
    @State private var showConfirmation = false
    
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
                    showConfirmation = true
                }) {
                    Text("Done")
                }
            }
        }
        .navigationTitle("Input Baby Weight")
        .navigationBarBackButtonHidden(true)
        .alert("Confirmation", isPresented: $showConfirmation) {
            Button("Save") {
                saveBabyWeight() // Simpan data ketika user menekan "Save"
            }
            Button("Cancel", role: .cancel) {
                // Do nothing, alert dismissed
            }
        } message: {
            Text("Are you sure you want to input this data?")
        }
    }
    
    private func saveBabyWeight() {
        if let weightValue = Double(weight) {
            // Save BabyWeight
            BabyWeight.inputBabyWeight(date: birthDate, weight: weightValue, modelContext: modelContext)
            dismiss() // Dismiss the view after saving
        } else {
            Text("Invalid weight input")
        }
    }
}

#Preview {
    InputWeightView()
}
