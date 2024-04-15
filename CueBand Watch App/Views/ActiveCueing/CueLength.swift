//
//  CueingLengthScreen.swift
//  CueBand Watch App
//
//  Created by Mitchel Mckee on 20/03/2024.
//

import SwiftUI

struct CueLength: View {
    @EnvironmentObject var navigationCoordinator: NavigationCoordinator
    @EnvironmentObject var settings: ActiveCueingSettings
    @State private var increment_amount = 10
    @State private var radius_amount = CGFloat(60)
    @State private var object_color = Color.black
    @State private var current_time = Date()
    
    private var finish_time: Date {
            return Calendar.current.date(byAdding: .minute, value: settings.cueing_length, to: current_time)!
        }
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        
        let screen_bounds = WKInterfaceDevice.current().screenBounds
        let buttonWidth = screen_bounds.width * 0.3
        let buttonHeight = screen_bounds.height * 0.2
        let spacing = screen_bounds.height * 0.03
        
        VStack(spacing: spacing) {
            Text(finish_time, style: .time)
                .onReceive(timer) { input in
                    current_time = input
                }
                .font(.title3)
                .fixedSize(horizontal: false, vertical: true)
                .frame(width: 100, height: 30)
                .background(Rectangle().fill(object_color).cornerRadius(radius_amount).shadow(radius: radius_amount))
            HStack {
                Button(action: {
                    if settings.cueing_length != 10 {
                        settings.cueing_length = max(0, settings.cueing_length - increment_amount)
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

                Text("\(settings.cueing_length)"+"\nmins")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(width: 60, height: 60)
                    .background(Rectangle().fill(object_color).cornerRadius(radius_amount).shadow(radius: radius_amount))

                Spacer()

                Button(action: {
                    if settings.cueing_length < 60{
                        settings.cueing_length += increment_amount
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
                    navigationCoordinator.navigate(to: .cuesPerMinute)
                }) {
                    Text("Back")
                        .font(.title3)
                        .padding()
                        .frame(width: buttonWidth * 1.3, height: buttonHeight * 1.3)
                        .background(Rectangle().fill(object_color).cornerRadius(10))
                }
                
                Spacer()
                
                Button(action: {
                    navigationCoordinator.navigate(to: .vibrationInterval)
                }) {
                    Text("Next")
                        .font(.title3)
                        .padding()
                        .frame(width: buttonWidth * 1.3, height: buttonHeight * 1.3)
                        .background(Rectangle().fill(object_color).cornerRadius(10))
                }
            }
        }
        .background(Color.white)
    }
}

struct CueingLength_Preview: PreviewProvider {
    static var previews: some View {
        CueLength()
            .environmentObject(NavigationCoordinator())
            .environmentObject(ActiveCueingSettings())
    }
}

