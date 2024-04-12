//
//  ActiveCueingScreen.swift
//  CueBand Watch App
//
//  Created by Mitchel Mckee on 11/03/2024.
//

import SwiftUI
import WatchKit

struct ActiveCueing: View {
    @EnvironmentObject var navigationCoordinator: NavigationCoordinator
    @EnvironmentObject var settings: ActiveCueingSettings
    
   
    @State private var timer_is_active = false
    @State private var radius_amount = CGFloat(10)
    @State private var cueing_style = 3
    @State private var cueing_rate = 30
    @State private var time_since_last_cue = 0
    
    var body: some View {
        
        let screen_bounds = WKInterfaceDevice.current().screenBounds
        let spacing = screen_bounds.width * 0.1
        
        VStack(spacing: 10) {
           
// Timer
            Text(formatTime(time: settings.time_remaining))
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(Color.white)
                .padding()
                .background(Color.black)
                .cornerRadius(radius_amount)
                .frame(width: screen_bounds.width * 0.95, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                .lineLimit(0)
                .shadow(radius: 10)

                
            HStack(spacing: spacing) {
                
// Stop Button
                Button(action: {
                    self.timer_is_active = false
                    settings.stopCueing()
                    navigationCoordinator.navigate(to: .start)
                }) {
                
                    Text("🛑")
                        .font(.title2)
                }
                .buttonStyle(CustomButtonStyle(color: .black, textColor: .white, width: 60, height: 60, radius: 10))

// Settings Button
                Button(action: {
                    self.timer_is_active = true
                }) {
                    Text("⚙️")
                        .font(.title2)

                }
                .buttonStyle(CustomButtonStyle(color: .black, textColor: .white, width: 60, height: 60, radius: 10))
            }
            .frame(maxWidth: screen_bounds.width * 0.5, maxHeight: .infinity)
            
        }
        .onAppear{
            self.timer_is_active = true
            settings.startCueing()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    
    }
    
// Format time from seconds to HH:mm:ss
private func formatTime(time: Int) -> String {
    let hours = time / 3600
    let minutes = (time % 3600) / 60
    let seconds = (time % 3600) % 60
    return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
private func triggerVibrations(repeatCount: Int){
    for _ in 0..<repeatCount {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            WKInterfaceDevice.current().play(.click)
            }
        }
    }
}

struct ActiveCueingScreen_Previews: PreviewProvider {
    static var previews: some View {
        ActiveCueing()
            .environmentObject(NavigationCoordinator())
            .environmentObject(ActiveCueingSettings())
    }
}
