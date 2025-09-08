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
    
    // Instantiate and return a Coordinator object
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
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
    
    // coordinator
    class Coordinator: NSObject {
        var view: ARView?
            
        @objc
        func handleLongPress(_ recognizer: UITapGestureRecognizer? = nil) {
            // Check if there is a view to work with
            guard let view = self.view else { return }

            // Obtain the location of a tap or touch gesture
            let tapLocation = recognizer!.location(in: view)

            // Checking if there's an entity at the tapped location within the view
            if let entity = view.entity(at: tapLocation) as? ModelEntity {
      
                // Check if this entity is anchored to an anchor
                    if let anchorEntity = entity.anchor {
                        // Remove the model from the scene
                        anchorEntity.removeFromParent()
                    }
            }
        }
      
    }
    
}

struct ActionPage: View {
    // model
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
    ActionPage()
}
