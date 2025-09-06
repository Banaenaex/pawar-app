//
//  StartScreen.swift
//  pawar-app
//
//  Created by T Krobot on 23/8/25.
//

import SwiftUI

struct StartScreen: View {
    var body: some View {
        GeometryReader { geometry in
            NavigationStack{
                ZStack{
                    Color(red: 0.792156862745098, green: 0.9568627450980393, blue: 0.9803921568627451)
                        .scaledToFill()
                        .ignoresSafeArea()
                    Image("StartPage")
                        .resizable()
                        .scaledToFill() // its fixed fr now
                        .ignoresSafeArea()
                        .frame(width: geometry.size.width * 0.4)
                    VStack {
                        NavigationLink {
                            NamePage()
                        } label: {
                            Image("StartButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width * 0.4)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    StartScreen()
}
