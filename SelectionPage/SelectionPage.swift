//
//  SelectionPage.swift
//  pawar-app
//
//  Created by T Krobot on 23/8/25.
//

import SwiftUI

struct SelectionPage: View{
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            GeometryReader{ geometry in
                ZStack{
                    Color(red: 0.792156862745098, green: 0.9568627450980393, blue: 0.9803921568627451)
                        .scaledToFill()
                        .ignoresSafeArea()
                    Image("SelectionPage")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                        .frame(width:geometry.size.width * 0.7, height: geometry.size.height*0.5, alignment: .center)
                    HStack{
                        NavigationLink{
                            ActionPage()
                        } label: {
                            Image("car")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 200)
                        }
                        NavigationLink{
                            ActionPage()
                        } label: {
                            Image("doggo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 150)
                        }
                        // only two animals because i have no time how am i getting 12 done in 2 weeks aint no way
                        // make that one.
                    }
                    VStack{
                        Spacer()
                        Button(action: { dismiss() }){
                            Image("BackButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width:150)
                                .offset(y:-100)
                        }
                    }
                    .navigationBarBackButtonHidden(true)
                }
            }
        }
    }
}

#Preview {
    SelectionPage()
}
