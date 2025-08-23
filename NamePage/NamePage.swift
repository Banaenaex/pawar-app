//
//  NamePage.swift
//  pawar-app
//
//  Created by T Krobot on 23/8/25.
//

import SwiftUI

struct NamePage: View{
    @State private var inputText: String = ""
    var body: some View {
        NavigationStack{
            ZStack{
                Image("NamePage")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                VStack{
                    TextField("Enter text here", text: $inputText)
                        .padding()
                        .frame(width:200,height: 50)
                        .multilineTextAlignment(.center)
                        .font(.custom("Architype Stedelijk W00", size:24))
                        .offset(y:550)
                    Spacer()
                    //add functionality to store name or soemthing like that
                    NavigationLink(destination:NamePage()){
                        Button(action: {
                            print("Enter")
                        }){
                            Image("NextButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width:200)
                                .offset(y:-50)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    NamePage()
}
