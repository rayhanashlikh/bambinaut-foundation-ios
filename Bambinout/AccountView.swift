//
//  AccountView.swift
//  Bambinout
//
//  Created by MacBook Air on 17/09/24.
//

import SwiftUI

struct AccountView: View {
    @State var userEmail = "example@mail.com"
    var body: some View {
        VStack {
            NavigationStack {
                Form {
                    HStack {
                        Text("Email")
                        Spacer()
                        Text(userEmail)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        NavigationLink(destination: ChangePasswordView()) {
                            Text("Change Password")
                        }
                    }
                }
                .scrollContentBackground(.hidden)
                .navigationTitle("Account")
                .navigationBarTitleDisplayMode(.inline)
                .background(.tabbarBgBlue)
            }
        }
    }
   
}

#Preview {
    AccountView()
}
