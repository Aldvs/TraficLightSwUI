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
    
    @State private var buttonTitle = "START"
    
    @State private var redOpacity: Double = 0.5
    @State private var yellowOpacity: Double = 0.5
    @State private var greenOpacity: Double = 0.5
    
    @State private var currentLight = CurrentLight.red
    
    private func getChangedLight() {
        
        let lightIsOn: Double = 1
        let lightIsOff: Double = 0.5

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

extension ContentView {
    
    var body: some View {
        
        VStack(spacing: 40){
            ColorCircle(color: .red, opacity: redOpacity)
            ColorCircle(color: .yellow, opacity: yellowOpacity)
            ColorCircle(color: .green, opacity: greenOpacity)
            
            Spacer()
            
            ChangeColorButton(title: buttonTitle) {
                if buttonTitle == "START" {
                    buttonTitle = "NEXT"
                }
                getChangedLight()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
