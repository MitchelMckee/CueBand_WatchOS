//
//  CueBandApp.swift
//  CueBand Watch App
//
//  Created by Mitchel Mckee on 11/02/2024.
//

import SwiftUI

@main
struct CueBand_Watch_AppApp: App {
    
    @StateObject var navigationCoordinator = NavigationCoordinator()
    @StateObject private var activeSettings = ActiveCueingSettings()
    
    var body: some Scene {
        WindowGroup{
            Group{
                switch navigationCoordinator.currentPage {
                case .start:
                    StartView()
                        .environmentObject(navigationCoordinator)
                case .cuesPerMinute:
                    CuesPerMinute()
                        .environmentObject(navigationCoordinator)
                        .environmentObject(activeSettings)
                case .scheduleTimeOfDay:
                    ScheduleTimeOfDay()
                        .environmentObject(navigationCoordinator)
                        .environmentObject(activeSettings)
                case .createEditSchedule:
                    CreateEditSchedule()
                        .environmentObject(navigationCoordinator)
                        .environmentObject(activeSettings)
                case .vibrationInterval:
                    VibrationInterval()
                        .environmentObject(navigationCoordinator)
                        .environmentObject(activeSettings)
                case .timeOfDay:
                    TimeOfDay()
                        .environmentObject(navigationCoordinator)
                        .environmentObject(activeSettings)
                case .cueingLength:
                    CueingLength()
                        .environmentObject(navigationCoordinator)
                        .environmentObject(activeSettings)
                case .activeCueing:
                    ActiveCueing()
                        .environmentObject(navigationCoordinator)
                        .environmentObject(activeSettings)
                }
            }
            .transition(.slide)
        }
    }
}
