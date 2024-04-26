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
    
    @State private var increment_amount = 5
    @State private var radius_amount = CGFloat(60)
    @State private var object_color = Color.black

    var body: some View {
        
        let screen_bounds = WKInterfaceDevice.current().screenBounds
        let spacing = screen_bounds.height * 0.03
        let buttonWidth = screen_bounds.width * 0.3
        let buttonHeight = screen_bounds.height * 0.2
        
        VStack(spacing: spacing) {
            Text("Cueing Interval")
                .frame(width: 150, height: 30)
                .background(Rectangle().fill(object_color).cornerRadius(radius_amount).shadow(radius: radius_amount))
            
            HStack {
                Button(action: {
                    trigger_haptic()
                    if settings.cue_interval > 5  {
                        settings.cue_interval -= increment_amount
                    }
                    
                }) {
                    Image(systemName: "minus")
                        .font(.title2)
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.center)
                        .frame(width: buttonWidth * 0.8, height: buttonHeight)
                        .background(Rectangle().fill(object_color).cornerRadius(radius_amount).shadow(radius: radius_amount))
                }

                Spacer()

                Text("every "+"\(settings.cue_interval)"+" seconds")
                    .font(.caption2)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(width: 70, height: 60)
                    .background(Rectangle().fill(object_color).cornerRadius(radius_amount).shadow(radius: radius_amount))

                Spacer()

                Button(action: {
                    trigger_haptic()
                    if settings.cue_interval >= 120 {
                        settings.cue_interval = settings.cue_interval
                    } else {
                        settings.cue_interval += increment_amount
                    }
                }) {
                    Image(systemName: "plus")
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
                    trigger_haptic()
                    navigationCoordinator.navigate(to: .cueingLength)
                }) {
                    Text("Back")
                        .font(.title3)
                        .padding()
                        .frame(width: buttonWidth * 1.3, height: buttonHeight * 1.3)
                        .background(Rectangle().fill(object_color).opacity(0.8).cornerRadius(10))
                }
                
                Spacer()
                
                Button(action: {
                    trigger_haptic()
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
