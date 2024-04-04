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
    
    var body: some Scene {
        WindowGroup{
            switch navigationCoordinator.currentPage {
            case .start:
                StartView().environmentObject(navigationCoordinator)
            case .cuesPerMinute:
                CuesPerMinute().environmentObject(navigationCoordinator)
            case .scheduleTimeOfDay:
                ScheduleTimeOfDay().environmentObject(navigationCoordinator)
            case .createEditSchedule:
                CreateEditSchedule().environmentObject(navigationCoordinator)
            case .vibrationInterval:
                VibrationInterval().environmentObject(navigationCoordinator)
            case .timeOfDay:
                TimeOfDay().environmentObject(navigationCoordinator)
            case .cueingLength:
                CueingLength().environmentObject(navigationCoordinator)
            case .activeCueing:
                ActiveCueing().environmentObject(navigationCoordinator)
            }
        }
    }
}
