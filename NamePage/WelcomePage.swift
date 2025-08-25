//
//  WelcomePage.swift
//  pawar-app
//
//  Created by T Krobot on 25/8/25.
//

import SwiftUI

struct WelcomePage: View {
    let name: String
    
    var body: some View {
        ZStack{
            Color(red: 0.792156862745098, green: 0.9568627450980393, blue: 0.9803921568627451)
                .ignoresSafeArea()
            VStack{
                Text("Welcome \(name)! Choose your pet!")
                    .font(.stedelijk(size:50))
                NavigationLink{
                    SelectionPage()
                } label: {
                    Image("NextButton")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview{
    WelcomePage(name: "sindya")
}
