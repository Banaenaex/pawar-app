//
//  FeedPage.swift
//  pawar-app
//
//  Created by T Krobot on 23/8/25.
//


import SwiftUI
import ARKit
import RealityKit

struct FoodBar: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack{
            HStack{
                // food
                Button{
                    // trigger
                }
                    label:{
                    Image("FishButton")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120)
                }
                    
                // drink
                Button{
                    // trigger
                }
                    label:{
                    Image("WaterButton")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120)
                }
                
            }
            HStack{
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
        .cornerRadius(30)
    }
}

struct FeedPage: View {
    @Binding var isPresented: Bool
    @State var modelName: String = "carwanim1"
    var body: some View {
        ZStack(alignment: .bottom) {
            ARViewContainer(modelName: $modelName)
                .ignoresSafeArea(edges: .all)
            
            FoodBar()
        }
    }
}


#Preview {
    FeedPage(isPresented: .constant(true))
}
