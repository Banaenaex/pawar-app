//
//  ActionBar.swift
//  pawar-app
//
//  Created by T Krobot on 30/8/25.
//

import SwiftUI

struct ActionView: View {
    var body: some View {
        VStack{
            ProgressBars()
            
            Spacer()
            
            ActionBar()
        }
    }
}

struct ProgressBars: View {
    var body: some View {
        HStack{
            
        }
    }
}

struct ActionBar: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack{
            HStack{
                // feedpage
                NavigationLink{
                    FeedPage()
                } label:{
                    Image("FeedButton")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150)
                }
                // gamepage
                NavigationLink{
                    GamePage()
                } label:{
                    Image("PlayButton")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150)
                }
                
            }
            HStack{
                // cleanpage
                NavigationLink{
                    CleanPage()
                } label:{
                    Image("CleanButton")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150)
                }
                // back button
                Button(action: { dismiss() }){
                    Image("BackButton")
                        .resizable()
                        .scaledToFit()
                        .frame(width:150)
                        .scaleEffect(1.3)
                        .offset(y:4)
                }
            }
        }
        .frame(width: 500)
        .padding(30)
        .background(Color(red: 0.792156862745098, green: 0.9568627450980393, blue: 0.9803921568627451))
    }
}
