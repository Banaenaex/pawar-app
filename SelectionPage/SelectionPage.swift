//
//  SelectionPage.swift
//  pawar-app
//
//  Created by T Krobot on 23/8/25.
//

import SwiftUI

struct SelectionPage: View{
    var body: some View {
        ZStack{
            Image("SelectionPage")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack{
                Spacer()
                NavigationLink(destination:NamePage()){
                    Button(action: {
                        print("Enter")
                    }){
                        Image("NextButton")
                            .resizable()
                            .scaledToFit()
                            .frame(width:200)
                    }
                }
            }
        }
    }
}

#Preview {
    SelectionPage()
}
