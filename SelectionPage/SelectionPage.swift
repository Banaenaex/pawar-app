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
        GeometryReader{ geometry in
            ZStack{
                Image("SelectionPage")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .frame(width:geometry.size.width * 0.7, height: geometry.size.height*0.5)
                
                HStack{
                    NavigationLink{
                        ActionPage(isPresented: .constant(true))
                    } label: {
                        Image("car")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                    }
                    NavigationLink{
                        ActionPage(isPresented: .constant(true))
                    } label: {
                        Image("doggo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                    }
                    // only two animals because i have no time how am i getting 12 done in 2 weeks aint no way
                }
                .frame(width: geometry.size.width * 0.4)
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

#Preview {
    SelectionPage()
}
