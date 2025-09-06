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
    // 1.
    @Binding var isPresented: Bool
    // 2.
    @State var modelName: String = "lowpolycar1"
    var body: some View {
        ZStack(alignment: .bottom){
            ARViewContainer(modelName: $modelName, isPresented: .constant(true))
            
            ActionBar()
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    struct ARViewContainer: UIViewRepresentable {
        @Binding var modelName: String
        @Binding var isPresented: Bool
        func makeUIView(context: Context) -> ARView {
            let arView = ARView(frame: .zero)
            
            let config = ARWorldTrackingConfiguration()
            config.planeDetection = [.horizontal, .vertical]
            config.environmentTexturing = .automatic
            arView.session.run(config)
            
            return arView
        }
        
        func updateUIView(_ uiView: ARView, context: Context) {
            // 1.
            let anchorEntity = AnchorEntity(plane:.any)
            
            // 2.
            guard let modelEntity = try? Entity.loadModel(named: modelName) else { return }
            
            // 3.
            anchorEntity.addChild(modelEntity)
            
            // 4.
            uiView.scene.addAnchor(anchorEntity)
        }
    }
}

#Preview {
    ActionPage(isPresented: .constant(true))
}
