//
//  ContentView.swift
//  pawar-app
//
//  Created by Minjia on 2/8/25.
//

import SwiftUI
import RealityKit

struct ContentView: View {
    var body: some View {
        RealityView { content in
            // RealityKit content can be added here
        }
        .overlay(alignment: .bottom) {
            HStack(spacing: 20) {
                Button(action: { print("Soap picked") }) {
                    Image("soap_icon")
                        .resizable()
                        .frame(width: 60, height: 60)
                }
                Button(action: { print("Towel picked") }) {
                    Image("towel_icon")
                        .resizable()
                        .frame(width: 60, height: 60)
                }
            }
            .padding()
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
}

#Preview {
    ContentView()
}
