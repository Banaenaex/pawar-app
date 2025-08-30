//
//  ActionPage.swift
//  pawar-app
//
//  Created by T Krobot on 25/8/25.
//

import SwiftUI
import RealityKit
import ARKit

struct ActionPage: View {
    var body: some View {
            ARViewContainer().edgesIgnoringSafeArea(.all)
        }
    }

    struct ARViewContainer: UIViewRepresentable {
        func makeUIView(context: Context) -> ARView {
            let arView = ARView(frame: .zero)

            let config = ARWorldTrackingConfiguration()
            config.planeDetection = [.horizontal, .vertical]
            arView.session.run(config)

            return arView
        }

        func updateUIView(_ uiView: ARView, context: Context) {}
    }

#Preview{
    ActionPage()
}
