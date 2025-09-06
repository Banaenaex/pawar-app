//
//  NamePage.swift
//  pawar-app
//
//  Created by T Krobot on 23/8/25.
//

import SwiftUI

struct NamePage: View{
    @State private var name: String = ""
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        GeometryReader{ geometry in
            NavigationStack{
                ZStack{
                    Color(red: 0.792156862745098, green: 0.9568627450980393, blue: 0.9803921568627451)
                        .scaledToFill()
                        .ignoresSafeArea()
                    Image("NamePage")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                        .frame(width: geometry.size.width * 0.5)
                    VStack {
                        Spacer()
                        TextField("Your name here...", text: $name)
                            .padding()
                            .frame(width: geometry.size.width * 0.5, height: geometry.size.height * -0.1)
                            .multilineTextAlignment(.center)
                            .font(.stedelijk(size:32))
                            .offset(y:geometry.size.height * -0.18)
                        // if possible should use geometry in case it runs on a diff device.
                        //                    Spacer()
                        //add functionality to store name or soemthing like that
                        NavigationLink {
                            WelcomePage(name: name)
                        } label: {
                            Image("NextButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width * 0.2)
                        }
                        Button(action: { dismiss() }){
                            Image("BackButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width * 0.2)
                        }
                        .navigationBarBackButtonHidden(true)
                    }
                }
            }
        }
    }
}

#Preview {
    NamePage()
}
