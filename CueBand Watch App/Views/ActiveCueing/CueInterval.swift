//
//  VibrationIntervalScreen.swift
//  CueBand Watch App
//
//  Created by Mitchel Mckee on 29/03/2024.
//

import SwiftUI

struct CueInterval: View {
    @EnvironmentObject var navigationCoordinator: NavigationCoordinator
    @EnvironmentObject var settings: ActiveCueingSettings
    
    @State private var setting = 5
    @State private var increment_amount = 30
    @State private var radius_amount = CGFloat(60)
    @State private var object_color = Color.black

    var body: some View {
        
        let screen_bounds = WKInterfaceDevice.current().screenBounds
        let spacing = screen_bounds.height * 0.1
        let buttonWidth = screen_bounds.width * 0.3
        let buttonHeight = screen_bounds.height * 0.2
        
        VStack(spacing: spacing) {
            HStack {
                Button(action: {
                    if setting > 5  {
                        self.setting -= increment_amount
                    }
                    
                }) {
                    Text("➖")
                        .font(.title2)
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.center)
                        .frame(width: buttonWidth * 0.8, height: buttonHeight)
                        .background(Rectangle().fill(object_color).cornerRadius(radius_amount).shadow(radius: radius_amount))
                }

                Spacer()

                Text("every "+"\(setting)"+" seconds")
                    .font(.caption2)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(width: 70, height: 60)
                    .background(Rectangle().fill(object_color).cornerRadius(radius_amount).shadow(radius: radius_amount))

                Spacer()

                Button(action: {
                    if setting >= 240 {
                        self.setting = self.setting
                    } else {
                        self.setting += increment_amount
                    }
                }) {
                    Text("➕")
                        .font(.title2)
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.center)
                        .frame(width: buttonWidth * 0.8, height: buttonHeight)
                        .background(Rectangle().fill(object_color).cornerRadius(radius_amount).shadow(radius: radius_amount))
                }
            }

            Spacer()

            HStack {
                Button(action: {
                    navigationCoordinator.navigate(to: .cueingLength)
                }) {
                    Text("Back")
                        .font(.title3)
                        .padding()
                        .frame(width: buttonWidth * 1.3, height: buttonHeight * 1.3)
                        .background(Rectangle().fill(object_color).cornerRadius(10))
                }
                
                Spacer()
                
                Button(action: {
                    navigationCoordinator.navigate(to: .activeCueing)
                }) {
                    Text("Start")
                        .font(.title3)
                        .padding()
                        .frame(width: buttonWidth * 1.3, height: buttonHeight * 1.3)
                        .background(Rectangle().fill(object_color).cornerRadius(10))
                }
            }
        }
        .padding()
        .background(Color.white)
    }
}

struct CueInterval_Preview: PreviewProvider {
    static var previews: some View {
        CueInterval()
            .environmentObject(NavigationCoordinator())
            .environmentObject(ActiveCueingSettings())
    }
}
