//
//  ActiveCueingScreen.swift
//  CueBand Watch App
//
//  Created by Mitchel Mckee on 11/03/2024.
//

import SwiftUI
import WatchKit
import Combine

struct ActiveCueing: View {
    @EnvironmentObject var navigationCoordinator: NavigationCoordinator
    @EnvironmentObject var settings: ActiveCueingSettings
    @EnvironmentObject var healthKitManager: HealthKitManager
    
    @State private var radius_amount = CGFloat(10)
    
    var body: some View {
        
        let screen_bounds = WKInterfaceDevice.current().screenBounds
        let spacing = screen_bounds.width * 0.1
        
        VStack(spacing: 10) {
            if settings.finished_cueing{
                Text("Cueing session completed!")
                    .font(.caption2)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(radius_amount)
                    .frame(width: screen_bounds.width * 0.95, height: 100)
                    .shadow(radius: 10)
            } else {
                Text(formatTime(time: settings.time_remaining))
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(radius_amount)
                    .frame(width: screen_bounds.width * 0.95, height: 100)
                    .lineLimit(0)
                    .shadow(radius: 10)
                
                }
            HStack(spacing: spacing) {
                                
                Button(action: {
                    settings.stopCueing()
                    healthKitManager.endWorkout()
                    navigationCoordinator.navigate(to: .start)
                }) {
                    Text("🛑")
                        .font(.title2)
                }
                .buttonStyle(CustomButtonStyle(color: .black, textColor: .white, width: 60, height: 60, radius: 10))

                Button(action: {
                    navigationCoordinator.navigate(to: .cuesPerMinute)
                }) {
                    Text("⚙️")
                        .font(.title2)
                }
                .buttonStyle(CustomButtonStyle(color: .black, textColor: .white, width: 60, height: 60, radius: 10))
            }
            .frame(maxWidth: screen_bounds.width * 0.5, maxHeight: .infinity)
        }
        .onAppear{
            print("View appeared - timer started")
            healthKitManager.startWorkout()
            settings.startCueing()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
    
private func formatTime(time: Int) -> String {
    let hours = time / 3600
    let minutes = (time % 3600) / 60
    let seconds = (time % 3600) % 60
    return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
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
