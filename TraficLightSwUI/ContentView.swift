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
    
    let attributedString = try! AttributedString(
        markdown: "START")
    
    @State var redOpacity: Double = 0.5
    @State var yellowOpacity: Double = 0.5
    @State var greenOpacity: Double = 0.5
    
    @State var currentLight = CurrentLight.red
    private let lightIsOn: Double = 1
    private let lightIsOff: Double = 0.5
    
    var body: some View {
        VStack{
            ColorCircle(color: .red.opacity(redOpacity))
                .padding()
                .id("red")
            ColorCircle(color: .yellow.opacity(yellowOpacity))
                .padding()
                .id("yellow")
            ColorCircle(color: .green.opacity(greenOpacity))
                .padding()
                .id("green")
            Spacer()
            
            Button(action: {
                
            }) {
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
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
