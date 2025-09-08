//
//  ActionBar.swift
//  pawar-app
//
//  Created by T Krobot on 30/8/25.
//

import SwiftUI
import Combine

struct ActionView: View {
    var body: some View {
        VStack{
            HealthBar()
            
            Spacer()
            
            ActionBar()
        }
    }
}

struct HealthBar: View {
    @State private var health: CGFloat = 1.0
    @State private var isPaused = false
    @State private var lastTick = Date()
    
    // Tunables
    let decayPerSecond: CGFloat = 0.005        // tiny decay
    let barHeight: CGFloat = 22
    let backgroundColor = Color(.systemGray5)
    let fillColor = Color.green
    let lowColor = Color.red                   // color when low (blended in)
    let lowBlendThreshold: CGFloat = 0.25      // start blending to red under 25%
    
    // timer
    @State private var ticker = Timer.publish(every: 1.0/60.0, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(spacing: 16) {
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: barHeight / 2)
                        .fill(backgroundColor)
                    
                    RoundedRectangle(cornerRadius: barHeight / 2)
                        .fill(currentFillColor)
                        .frame(width: max(0, health) * geo.size.width)
                        .animation(.linear(duration: 1.0/60.0), value: health)
                        .overlay(
                            // subtle gloss
                            LinearGradient(
                                gradient: Gradient(colors: [Color.white.opacity(0.25), Color.white.opacity(0.05)]),
                                startPoint: .top, endPoint: .bottom
                            )
                            .clipShape(RoundedRectangle(cornerRadius: barHeight / 2))
                        )
                }
            }
            .frame(height: barHeight)
            .overlay(
                Text("\(Int(health * 100))%")
                    .font(.caption).bold()
                    .foregroundStyle(.primary)
            )
            .onReceive(ticker) { _ in
                guard !isPaused, health > 0 else { lastTick = Date(); return } // remove after you figure out how to interact w car
                let now = Date()
                let dt = now.timeIntervalSince(lastTick)
                lastTick = now
                let decay = decayPerSecond * CGFloat(dt)
                health = max(0, health - decay)
            }
            .onAppear { lastTick = Date() }
            
            // these as well
            HStack {
                Button(isPaused ? "Resume" : "Pause") { isPaused.toggle() }
                Button("Reset") { health = 1.0; lastTick = Date() }
                Button("Heal +10%") { health = min(1.0, health + 0.10) }
                Button("Damage 10%") { health = max(0.0, health - 0.10) }
            }
            .buttonStyle(.bordered)
        }
        .padding()
    }
    
    private var currentFillColor: Color {
        // Blend to red when low
        if health <= lowBlendThreshold {
            // linear interpolate between red and green based on health/threshold
            let t = max(0, health / lowBlendThreshold)
            return Color(
                red: Double((1 - t) * 1.0 + t * 0.0),   // red -> green
                green: Double((1 - t) * 0.0 + t * 1.0),
                blue: 0.0
            )
        }
        return fillColor
    }
}

struct ActionBar: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack{
            HStack{
                // feedpage
                NavigationLink{
                    FeedPage(isPresented: .constant(true))
                } label:{
                    Image("FeedButton")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150)
                }
                // gamepage
                NavigationLink{
                    GamePage()
                } label:{
                    Image("PlayButton")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150)
                }
                
            }
            HStack{
                // cleanpage
                NavigationLink{
                    CleanPage()
                } label:{
                    Image("CleanButton")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150)
                }
                // back button
                Button(action: { dismiss() }){
                    Image("BackButton")
                        .resizable()
                        .scaledToFit()
                        .frame(width:150)
                        .scaleEffect(1.3)
                        .offset(y:4)
                }
            }
        }
        .frame(width: 500)
        .padding(30)
        .background(Color(red: 0.792156862745098, green: 0.9568627450980393, blue: 0.9803921568627451))
        .cornerRadius(30)
    }
}

#Preview {
    ActionView()
}
