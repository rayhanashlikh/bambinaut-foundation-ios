//
//  MainItem.swift
//  NutrientApp
//
//  Created by MacBook Air on 07/09/24.
//

import SwiftUI

struct MainItem: View {
    
    var imageName: String
    var Title: String
    var desc:  String
    var color: Color
    var selfIndex: Int
    
    var body: some View {
        
        ZStack {
            Color(red: 173/255, green: 216/255, blue: 230/255) // Baby blue color
                           .edgesIgnoringSafeArea(.all)
            RoundedRectangle(cornerRadius: 15)
                           .foregroundColor(Color.white) // Set color to solid white
                           .frame(width: 170, height: 230)
                       
            VStack{
                Spacer()
                
                Image(imageName)
                    .resizable()
                    .frame(width: 80,height: 80)
                
              Spacer()
                
                Button(){
                    
                }label: {
                    Text (Title)
                        .frame(width: 130, height: 40)
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding(.top, 10)
                        .padding(.bottom, 10)
                        .padding(.horizontal)  // Add horizontal padding for more spacing
                        .background(Color(red: 246/255, green: 234/255, blue: 203/255)) // Cream color
                        .cornerRadius(10)
                }
                .padding(.bottom,10)
            }
            .frame(width: 165,height: 230)
        }
    }
    
}
#Preview {
    MainItem(imageName:"avocado", Title: "Avocado", desc: "Fiber", color: Color.white , selfIndex: 0)
}
