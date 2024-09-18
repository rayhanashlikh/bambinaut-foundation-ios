//
//  ProfileView.swift
//  Bambinout
//
//  Created by MacBook Air on 17/09/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            
            NavigationStack {
                List {
                    NavigationLink (
                        destination : BabyProfileView()
                    ) {
                        Text("Baby Profile")
                    }
                    
                    NavigationLink (
                        destination : AccountView()
                    ) {
                        Text("Account")
                    }
                    
                    NavigationLink (
                        destination : ChangePasswordView()
                    ) {
                        Text("Change Password")
                    }
                
                    
                }
                
            }
        }
    }
}

#Preview {
    ProfileView()
}
