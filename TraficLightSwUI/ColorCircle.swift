//
//  ColorCircle.swift
//  TraficLightSwUI
//
//  Created by admin on 16.02.2022.
//

import SwiftUI

struct ColorCircle: View {
    
    let color: Color
    let opacity: Double
    
    var body: some View {
        Circle()
            .frame(width: 125, height: 125)
            .foregroundColor(color)
            .opacity(opacity)
            .overlay(Circle().stroke(Color.white, lineWidth: 7))
            .shadow(radius: 14)
    }
}

struct ColorCircle_Previews: PreviewProvider {
    static var previews: some View {
        ColorCircle(color: .indigo, opacity: 1)
    }
}
