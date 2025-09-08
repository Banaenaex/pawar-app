//
//  ActionPage.swift
//  pawar-app
//
//  Created by T Krobot on 25/8/25.
//

import SwiftUI
import RealityKit
import ARKit
import Combine

struct ARViewContainer: UIViewRepresentable {
    @Binding var modelName: String
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal]
        config.environmentTexturing = .automatic
        arView.session.run(config)
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        // 1.
        let anchorEntity = AnchorEntity(plane:.any)
        
        // 2.
        guard let modelEntity = try? Entity.loadModel(named: modelName) else { return }
        
        // scale down
//            modelEntity.scale = SIMD3<Float>(repeating: 0.3)
        
        // collisions
        modelEntity.generateCollisionShapes(recursive: true)
        
        // animations
        for anim in modelEntity.availableAnimations {
            modelEntity.playAnimation(anim.repeat(duration: 10), transitionDuration: 1.25, startsPaused: false)
        }

        // 3.
        anchorEntity.addChild(modelEntity)
        
        // gestures
        uiView.installGestures([.all], for: modelEntity as Entity & HasCollision)
        
        // 4.
        uiView.scene.addAnchor(anchorEntity)
    }
}

struct ActionPage: View {
    // 1.
    @Binding var isPresented: Bool
    // 2.
    @State var modelName: String = "car"
    var body: some View {
        ZStack(alignment: .bottom){
            ARViewContainer(modelName: $modelName)
            
            ActionBar()
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ActionPage(isPresented: .constant(true))
}
