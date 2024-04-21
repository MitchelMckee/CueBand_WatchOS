//
//  EditScheduleDayView.swift
//  CueBand Watch App
//
//  Created by Mitchel Mckee on 21/04/2024.
//

import SwiftUI

struct EditScheduleDayView: View {
    
    @EnvironmentObject var navigationCoordinator: NavigationCoordinator
    @EnvironmentObject var schedule_settings: ScheduledCueingSettings
    
    var body: some View {
        ScrollView {
            ForEach(Array(schedule_settings.day_schedules[schedule_settings.days_of_week[selectedDayIndex]] ?? []).indices, id: \.self) { index in
                if let cueTime = schedule_settings.day_schedules[schedule_settings.days_of_week[selectedDayIndex]]?[index] {
                    ScheduleRow(cueTime: cueTime, day: schedule_settings.days_of_week[selectedDayIndex], index: index)
                        .environmentObject(schedule_settings)
                        .environmentObject(navigationCoordinator)
                }
            }
        }
    }
}

struct ScheduleRow: View {
    
    @EnvironmentObject var navigationCoordinator: NavigationCoordinator
    @EnvironmentObject var schedule_settings: ScheduledCueingSettings
    
    var cueTime: ScheduledCueingSettings.CueTime
    var day: String
    var index: Int
          
    var body: some View {
        
        HStack {
            Text("\(cueTime.hour):\(String(format: "%02d", cueTime.min))")
            Spacer()
            
            Button("Edit") {
                schedule_settings.chosen_day = day
                schedule_settings.scheduled_hour = cueTime.hour
                schedule_settings.scheduled_min = cueTime.min
                navigationCoordinator.navigate(to: .timeOfDay)
            }
        }
    }
}

struct EditScheduleDayView_Preview: PreviewProvider {
        static var previews: some View {
            EditScheduleDayView()
                .environmentObject(NavigationCoordinator())
                .environmentObject(ScheduledCueingSettings())
        }
}
