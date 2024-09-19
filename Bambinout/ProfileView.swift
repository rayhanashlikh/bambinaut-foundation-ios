//
//  ProfileView.swift
//  Bambinout
//
//  Created by MacBook Air on 17/09/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    
                List {
                    NavigationLink(destination: BabyProfileView()) {
                        Label("Baby Profile", systemImage: "figure.child")
                    }
                    
                    NavigationLink(destination: AccountView()) {
                        Label("Account", systemImage: "person.fill")
                    }
                    
                    NavigationLink(destination: ChangePasswordView()) {
                        Label("Change Password", systemImage: "key")
                    }
                }/*.listStyle(.plain)*/
                .scrollContentBackground(.hidden)
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Profile")
            .background(.tabbarBgBlue)
        }
    }
}

#Preview {
    ProfileView()
}
