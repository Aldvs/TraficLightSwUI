//
//  ContentView.swift
//  TraficLightSwUI
//
//  Created by admin on 16.02.2022.
//

import SwiftUI

enum CurrentLight {
    case red, yellow, blue
}

struct ContentView: View {
    
    @State private var attributedString = try! AttributedString(
        markdown: "START")
    
    @State private var redOpacity: Double = 0.5
    @State private var yellowOpacity: Double = 0.5
    @State private var greenOpacity: Double = 0.5
    
    @State private var currentLight = CurrentLight.red
    private let lightIsOn: Double = 1
    private let lightIsOff: Double = 0.5
    
    var body: some View {
        VStack{
            ColorCircle(color: .red.opacity(redOpacity))
                .padding()
            ColorCircle(color: .yellow.opacity(yellowOpacity))
                .padding()
            ColorCircle(color: .green.opacity(greenOpacity))
                .padding()
            Spacer()
            
            Button(action: { getChangedLight() }) {
                textSettings
            }
            .shadow(radius: 30)
        }
        .padding()
    }
    
    private var textSettings: some View {
        Text(attributedString)
            .font(.title)
            .fontWeight(.bold)
            .padding(.horizontal, 50.0)
            .padding(.vertical, 20)
            .background(Color.yellow)
            .cornerRadius(20)
            .foregroundColor(.black)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white, lineWidth: 5)
            )
    }
    
    private func getChangedLight() {
        attributedString = "NEXT"
        
        switch currentLight {
        case .red:
            greenOpacity = lightIsOff
            redOpacity = lightIsOn
            currentLight = .yellow
        case .yellow:
            redOpacity = lightIsOff
            yellowOpacity = lightIsOn
            currentLight = .blue
        case .blue:
            yellowOpacity = lightIsOff
            greenOpacity = lightIsOn
            currentLight = .red
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
