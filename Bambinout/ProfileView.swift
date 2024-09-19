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
                Image("yourImageName")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                    .padding(.top)
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
                }.listStyle(.plain)
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Profile")
            
        }
    }
}

#Preview {
    ProfileView()
}
