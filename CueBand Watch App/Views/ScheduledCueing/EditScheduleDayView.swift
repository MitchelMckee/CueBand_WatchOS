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
            let day = schedule_settings.edit_chosen_day
            ForEach(schedule_settings.day_schedules[day] ?? [], id: \.self) { cueTime in
                ScheduleRow(cueTime: cueTime, day: day)
                    .environmentObject(schedule_settings)
                    .environmentObject(navigationCoordinator)
            }
        }
    }
}


struct ScheduleRow: View {
    
    @EnvironmentObject var navigationCoordinator: NavigationCoordinator
    @EnvironmentObject var schedule_settings: ScheduledCueingSettings
    
    var cueTime: ScheduledCueingSettings.CueTime
    var day: String
          
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
