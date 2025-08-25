//
//  StartScreen.swift
//  pawar-app
//
//  Created by T Krobot on 23/8/25.
//

import SwiftUI

struct StartScreen: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Image("StartPage")
                    .resizable()
                    .scaledToFill() // its fixed fr now
                    .ignoresSafeArea()
                VStack {
                    NavigationLink {
                        NamePage()
                    } label: {
                        Image("StartButton")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200)
                    }
                }
            }
        }
    }
}

#Preview {
    StartScreen()
}
