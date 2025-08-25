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
        NavigationStack{
            ZStack{
                Image("NamePage")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    TextField("Your name here...", text: $name)
                        .padding()
                        .frame(width:250,height: 50)
                        .multilineTextAlignment(.center)
                        .font(.stedelijk(size:32))
                        .offset(y:-105)
                    // if possible should use geometry in case it runs on a diff device.
//                    Spacer()
                    //add functionality to store name or soemthing like that
                    NavigationLink {
                        WelcomePage(name: name)
                    } label: {
                        Image("NextButton")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200)
                    }
                    Button(action: { dismiss() }){
                        Image("BackButton")
                            .resizable()
                            .scaledToFit()
                            .frame(width:150)
                    }
                    .navigationBarBackButtonHidden(true)
                }
            }
        }
    }
}

#Preview {
    NamePage()
}
