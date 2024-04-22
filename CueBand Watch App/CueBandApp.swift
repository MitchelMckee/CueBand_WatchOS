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
    @StateObject var healthKitManager = HealthKitManager()
    
    var body: some Scene {
        
        
        WindowGroup {
            Group{
                switch navigationCoordinator.currentPage {
                case .start: StartView()
                case .cuesPerMinute: CueStyle()
                case .scheduleTimeOfDay: ScheduleTimeOfDay()
                case .createEditSchedule: CreateEditSchedule()
                case .vibrationInterval: CueInterval()
                case .timeOfDay: TimeOfDay()
                case .cueingLength: CueLength()
                case .activeCueing: ActiveCueing()
                case .daysOfWeek: DaysOfWeek()
                case .editDaySchedule: EditScheduleDayView()
                }
            }
            .environmentObject(navigationCoordinator)
            .environmentObject(activeSettings)
            .environmentObject(scheduleSettings)
            .environmentObject(healthKitManager)
            .onAppear(perform: requestHealthKitAuthorisation)
            .onAppear(perform: requestNotificationPermission)
        }
    }
    
    private func requestHealthKitAuthorisation() {
        if healthKitManager.isHealthKitAvailable() && !healthKitManager.hasRequestedAuthorisation {
            healthKitManager.requestAuthorisation { authorised, error  in
                if !authorised {
                    print("HealthKit auth not granted")
                }
            }
        }
    }
}
