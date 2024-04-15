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
    @StateObject var activeSettings = ActiveCueingSettings()
    @StateObject var scheduleSettings = ScheduledCueingSettings()
            
    var body: some Scene {
        WindowGroup{
                switch navigationCoordinator.currentPage {
                case .start:
                    StartView()
                        .environmentObject(navigationCoordinator)
                case .cuesPerMinute:
                    CueStyle()
                        .environmentObject(navigationCoordinator)
                        .environmentObject(activeSettings)
                case .scheduleTimeOfDay:
                    ScheduleTimeOfDay()
                        .environmentObject(navigationCoordinator)
                        .environmentObject(activeSettings)
                        .environmentObject(scheduleSettings)
                case .createEditSchedule:
                    CreateEditSchedule()
                        .environmentObject(navigationCoordinator)
                        .environmentObject(activeSettings)
                        .environmentObject(scheduleSettings)
                case .vibrationInterval:
                    CueInterval()
                        .environmentObject(navigationCoordinator)
                        .environmentObject(activeSettings)
                case .timeOfDay:
                    TimeOfDay()
                        .environmentObject(navigationCoordinator)
                        .environmentObject(activeSettings)
                        .environmentObject(scheduleSettings)
                case .cueingLength:
                    CueLength()
                        .environmentObject(navigationCoordinator)
                        .environmentObject(activeSettings)
                case .activeCueing:
                    ActiveCueing()
                        .environmentObject(navigationCoordinator)
                        .environmentObject(activeSettings)
                        .environmentObject(scheduleSettings)
                }
        }
    }
}
