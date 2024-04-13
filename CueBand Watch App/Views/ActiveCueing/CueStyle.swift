//
//  ActiveCueingScreen.swift
//  CueBand Watch App
//
//  Created by Mitchel Mckee on 11/03/2024.
//

import SwiftUI

struct CueStyle: View {
    @EnvironmentObject var navigationCoordinator: NavigationCoordinator
    @EnvironmentObject var settings: ActiveCueingSettings
    @State private var increment_amount = 1
    @State private var radius_amount = CGFloat(60)
    @State private var object_color = Color.black

    var body: some View {
        
        let screen_bounds = WKInterfaceDevice.current().screenBounds
        let buttonWidth = screen_bounds.width * 0.3
        let buttonHeight = screen_bounds.height * 0.2
        let indicator = screen_bounds.width * 0.3
        let spacing = screen_bounds.width * 0.05
        
        VStack(spacing: spacing) {
            HStack {
                Button(action: {
                    if settings.cues_per_minute > 1  {
                        self.settings.cues_per_minute -= increment_amount
                    }
                    
                }) {
                    Text("➖")
                        .font(.title2)
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.center)
                        .frame(width: buttonWidth, height: buttonHeight)
                        .background(Rectangle().fill(object_color).cornerRadius(radius_amount).shadow(radius: radius_amount))
                }
                
                Spacer()
                
                Text("x"+"\(settings.cues_per_minute)")
                    .font(.largeTitle)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(width: indicator, height: indicator)
                    .background(Rectangle().fill(object_color).cornerRadius(radius_amount).shadow(radius: radius_amount))
                
                Spacer()
                
                Button(action: {
                    if settings.cues_per_minute >= 6 {
                        self.settings.cues_per_minute = self.settings.cues_per_minute
                    } else {
                        self.settings.cues_per_minute += increment_amount
                    }
                }) {
                    Text("➕")
                        .font(.title2)
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.center)
                        .frame(width: buttonWidth, height: buttonHeight)
                        .background(Rectangle().fill(object_color).cornerRadius(radius_amount).shadow(radius: radius_amount))
                }
            }
            
            Spacer()
            
            HStack {
                Button(action: {
                    navigationCoordinator.navigate(to: .start)
                }) {
                    Text("Back")
                        .font(.title3)
                        .padding()
                        .frame(width: buttonWidth * 1.3, height: buttonHeight * 1.3)
                        .background(Rectangle().fill(object_color).cornerRadius(10))
                }
                
                Spacer()
                
                Button(action: {
                    navigationCoordinator.navigate(to: .cueingLength)
                }) {
                    Text("Next")
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

struct CueStyle_Preview: PreviewProvider {
    static var previews: some View {
        CueStyle()
            .environmentObject(NavigationCoordinator())
            .environmentObject(ActiveCueingSettings())
    }
}
