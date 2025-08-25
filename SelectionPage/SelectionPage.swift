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
            }
        }
    }
}

#Preview {
    SelectionPage()
}
