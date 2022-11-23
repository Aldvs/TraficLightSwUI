//
//  ContentView.swift
//  TraficLightSwUI
//
//  Created by admin on 16.02.2022.
//

import SwiftUI

enum CurrentLight {
    case red, yellow, blue, off
}

struct ContentView: View {
    
    @State private var buttonTitle = "START"
    @State private var currentLight = CurrentLight.off
    
    private func getChangedLight() {
        
        switch currentLight {
        case .red: currentLight = .yellow
        case .yellow: currentLight = .blue
        case .blue: currentLight = .red
        case .off: currentLight = .red
        }
    }

}

extension ContentView {
    
    var body: some View {
        
        VStack(spacing: 40){
            ColorCircle(color: .red, opacity: currentLight == .red ? 1 : 0.3)
            ColorCircle(color: .yellow, opacity: currentLight == .yellow ? 1 : 0.3)
            ColorCircle(color: .green, opacity: currentLight == .blue ? 1 : 0.3)
            
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
