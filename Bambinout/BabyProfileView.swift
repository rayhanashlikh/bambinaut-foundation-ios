//
//  BabyProfileView.swift
//  Bambinout
//
//  Created by MacBook Air on 17/09/24.
//

import SwiftUI

struct BabyProfileView: View {
    @State var babyName = ""
    var body: some View {
        VStack {
            NavigationStack {
                Form {
                    HStack {
                        Text("Baby Name")
                        TextField(text: $babyName, prompt: Text("Baby Name")) {
                            Text("Baby Name")
                        }.multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("Gender")
                        
                    }
                    HStack {
                        Text("Birth Date")
                        
                    }
                    HStack {
                        NavigationLink (
                            destination : InputAllergiesView()
                        ) {
                            Text("Allergies")
                        }
                        
                        
                    }
                }
                
            }
        }
    }
}

#Preview {
    BabyProfileView()
}
