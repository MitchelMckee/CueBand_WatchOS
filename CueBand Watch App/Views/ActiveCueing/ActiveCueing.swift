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
    @EnvironmentObject var healthKitManager: HealthKitManager
    
    @State private var timer_is_active = false
    @State private var radius_amount = CGFloat(10)
 
    @State private var time_since_last_cue = 0
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
       
        let screen_bounds = WKInterfaceDevice.current().screenBounds
        let spacing = screen_bounds.width * 0.1
        
        VStack(spacing: 10) {
           
// Timer -------------------------------------

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
                .onReceive(timer) { _ in
                    guard timer_is_active else { return }
                   
                    if settings.time_remaining > 0 {
                        settings.time_remaining -= 1
                        time_since_last_cue += 1
                        
                        if time_since_last_cue >= settings.cues_per_minute {
                            time_since_last_cue = 0
                            triggerVibrations(repeatCount: settings.cue_style)
                        }
                    }
                    
                }
            
// -------------------------------------------
            
            HStack(spacing: spacing) {
                
// Stop Button -------------------------------

                Button(action: {
                    self.timer_is_active = false
                    settings.stopCueing()
                    navigationCoordinator.navigate(to: .start)
                }) {
                
                    Text("🛑")
                        .font(.title2)
                }
                .buttonStyle(CustomButtonStyle(color: .black, textColor: .white, width: 60, height: 60, radius: 10))
                
// -------------------------------------------

// Settings Button ----------------------------
                Button(action: {
                    navigationCoordinator.navigate(to: .cuesPerMinute)
                }) {
                    Text("⚙️")
                        .font(.title2)

                }
                .buttonStyle(CustomButtonStyle(color: .black, textColor: .white, width: 60, height: 60, radius: 10))
            }
            
// -------------------------------------------
            
        .frame(maxWidth: screen_bounds.width * 0.5, maxHeight: .infinity)
            
        }
        .onAppear{
            self.timer_is_active = true
            settings.startCueing()
            healthKitManager.startWorkout()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    
    }
    
// Format time from seconds to hh:mm:ss
private func formatTime(time: Int) -> String {
    let hours = time / 3600
    let minutes = (time % 3600) / 60
    let seconds = (time % 3600) % 60
    return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
private func triggerVibrations(repeatCount: Int){
    let interval = 0.5 // Small interval to stop vibrations stacking
        for i in 0..<repeatCount {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * interval) {
                WKInterfaceDevice.current().play(.click)
            }
        }
    }
}

struct ActiveCueing_Previews: PreviewProvider {
    static var previews: some View {
        ActiveCueing()
            .environmentObject(NavigationCoordinator())
            .environmentObject(ActiveCueingSettings())
            .environmentObject(HealthKitManager())
    }
}
