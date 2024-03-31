//
//  StartView.swift
//  CueBand Watch App
//
//  Created by Mitchel Mckee on 20/03/2024.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        VStack(spacing: 20) {
            Button(action: {
                
            }){ Text("Start")
                    .font(.title2)
            }.buttonStyle(CustomButtonStyle(color: .black, textColor: .white))
                
        }
        .padding()
        .background(Color.white)
    }
    
    
struct CustomButtonStyle: ButtonStyle {
    var color: Color
    var textColor: Color
        
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .shadow(radius: 10)
            .frame(width: 80, height: 60)
            .background(color)
            .foregroundColor(textColor)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .scaleEffect(configuration.isPressed ? 0.8 : 1.0)
            .animation(.easeOut, value: configuration.isPressed)
        }
    }

}



#Preview {
    StartView()
}
