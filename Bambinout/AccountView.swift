//
//  AccountView.swift
//  Bambinout
//
//  Created by MacBook Air on 17/09/24.
//

import SwiftUI

struct AccountView: View {
    @State var userEmail = ""
    var body: some View {
        VStack {
            NavigationStack {
                Form {
                    HStack {
                        Text("Email")
                        TextField(text: $userEmail, prompt: Text("User's Email")) {
                            Text("Baby Name")
                        }.multilineTextAlignment(.trailing)
                    }
                    HStack {
                        NavigationLink (
                            destination : ChangePasswordView()
                        ) {
                            Text("Password")
                        }
                        
                    }
                    
                }
                .navigationTitle("Account").navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    AccountView()
}
