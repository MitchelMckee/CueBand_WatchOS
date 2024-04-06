//
//  CustomButtonStyle.swift
//  CueBand Watch App
//
//  Created by Mitchel Mckee on 06/04/2024.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    var color: Color
    var textColor: Color
    var width: CGFloat
    var height: CGFloat
    var radius: CGFloat
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .shadow(radius: 10)
            .frame(width: width, height: height)
            .background(color)
            .foregroundColor(textColor)
            .clipShape(RoundedRectangle(cornerRadius: radius))
            .scaleEffect(configuration.isPressed ? 0.8 : 1.0)
            .animation(.easeOut, value: configuration.isPressed)
    }
}
