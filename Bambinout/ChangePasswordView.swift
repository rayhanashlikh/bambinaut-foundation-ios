//
//  ChangePasswordView.swift
//  Bambinout
//
//  Created by MacBook Air on 17/09/24.
//

import SwiftUI

struct ChangePasswordView: View {
    @State var userPassword = ""
    @State var newPassword = ""
    @State var confirmPassword = ""
    var body: some View {
        VStack {
            NavigationStack {
                Form {
                    HStack {
                        Text("Password")
                        TextField(text: $userPassword, prompt: Text("Password")) {
                            Text("Password")
                        }.multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("New Password")
                        TextField(text: $newPassword, prompt: Text("New Password")) {
                            Text("New Password")
                        }.multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("Confirm Password")
                        TextField(text: $confirmPassword, prompt: Text("Confirm Password")) {
                            Text("Confirm Password")
                        }.multilineTextAlignment(.trailing)
                    }
                    
                }
                .navigationTitle("Change Password")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing: Button("Save") {
                    saveChanges()
                })
            }
        }
    }
    
    private func saveChanges() {
        print("Old Password: \(userPassword)")
        print("New Password: \(newPassword)")
        print("Confirm Password: \(confirmPassword)")
        
        // nanti kasi validasi dsni
    }
}

#Preview {
    ChangePasswordView()
}
