//
//  GamePage.swift
//  pawar-app
//
//  Created by T Krobot on 23/8/25.
//

import SwiftUI
import ARKit
import RealityKit
struct GamePage: View {
    var body: some View {
        Text("GamePage")
    }
}
//import SpriteKit
//
//class GameScene: SKScene, SKPhysicsContactDelegate {
//    
//    var player: SKSpriteNode!
//    var scoreLabel: SKLabelNode!
//    var score = 0 {
//        didSet {
//            scoreLabel.text = "Score: \(score)"
//        }
//    }
//    
//    override func didMove(to view: SKView) {
//        // Setup physics world
//        physicsWorld.gravity = CGVector(dx: 0, dy: -9.8) // Standard gravity
//        physicsWorld.contactDelegate = self
//        
//        // Setup background
//        backgroundColor = .blue // Or add a background image
//        
//        // Setup player
//        player = SKSpriteNode(color: .red, size: CGSize(width: 100, height: 20))
//        player.position = CGPoint(x: frame.midX, y: frame.minY + 50)
//        player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
//        player.physicsBody?.isDynamic = false // Player doesn't fall
//        addChild(player)
//        
//        // Setup score label
//        scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
//        scoreLabel.text = "Score: 0"
//        scoreLabel.fontSize = 20
//        scoreLabel.position = CGPoint(x: frame.minX + 60, y: frame.maxY - 40)
//        addChild(scoreLabel)
//        
//        // Start spawning items
//        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(spawnFallingItem), userInfo: nil, repeats: true)
//    }
//    
//    @objc func spawnFallingItem() {
//        let item = SKSpriteNode(color: .green, size: CGSize(width: 30, height: 30))
//        let randomX = CGFloat.random(in: frame.minX + 20...frame.maxX - 20)
//        item.position = CGPoint(x: randomX, y: frame.maxY + 50)
//        item.physicsBody = SKPhysicsBody(rectangleOf: item.size)
//        item.physicsBody?.categoryBitMask = 1 // Assign a category for collision detection
//        item.physicsBody?.contactTestBitMask = 1 // Detect contact with player
//        addChild(item)
//    }
//    
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        guard let touch = touches.first else { return }
//        let location = touch.location(in: self)
//        player.position.x = location.x // Move player horizontally with touch
//    }
//    
//    func didBegin(_ contact: SKPhysicsContact) {
//        // Check if player caught an item
//        if contact.bodyA.node == player || contact.bodyB.node == player {
//            let caughtItem = (contact.bodyA.node == player) ? contact.bodyB.node : contact.bodyA.node
//            
//            if caughtItem?.physicsBody?.categoryBitMask == 1 { // Check if it's a falling item
//                caughtItem?.removeFromParent()
//                score += 1
//            }
//        }
//    }
//}

//struct FoodBar: View {
//    @Environment(\.dismiss) private var dismiss
//    var body: some View {
//        VStack{
//            HStack{
//                // feedpage
//                NavigationLink{
//                    FeedPage(isPresented: .constant(true))
//                } label:{
//                    Image("FeedButton")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 150)
//                }
//                // gamepage
//                NavigationLink{
//                    GamePage()
//                } label:{
//                    Image("PlayButton")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 150)
//                }
//                
//            }
//            HStack{
//                // cleanpage
//                NavigationLink{
//                    CleanPage()
//                } label:{
//                    Image("CleanButton")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 150)
//                }
//                // back button
//                Button(action: { dismiss() }){
//                    Image("BackButton")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width:150)
//                        .scaleEffect(1.3)
//                        .offset(y:4)
//                }
//            }
//        }
//        .frame(width: 500)
//        .padding(30)
//        .background(Color(red: 0.792156862745098, green: 0.9568627450980393, blue: 0.9803921568627451))
//        .cornerRadius(30)
//    }
//}
//
//struct FeedPage: View {
//    @Binding var isPresented: Bool
//    @State var modelName: String = "car"
//    var body: some View {
//        ZStack(alignment: .bottom) {
//            ARViewContainer(modelName: $modelName)
//                .ignoresSafeArea(edges: .all)
//            
//            FoodBar()
//        }
//    }
//}
//
//
//#Preview {
//    FeedPage(isPresented: .constant(true))
//}
