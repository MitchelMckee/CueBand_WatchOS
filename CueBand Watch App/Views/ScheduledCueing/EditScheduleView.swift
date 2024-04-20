//
//  EditScheduleView.swift
//  CueBand Watch App
//
//  Created by Mitchel Mckee on 20/04/2024.
//

import SwiftUI

struct EditScheduleView: View {
    @EnvironmentObject var navigationCoordinator: NavigationCoordinator
    @EnvironmentObject var schedule_settings: ScheduledCueingSettings
        
    var body: some View {
        
        List {
            ForEach(schedule_settings.days_of_week, id: \.self) { day in
                Section(header: Text(day)) {
                    ForEach(Array(schedule_settings.day_schedules[day] ?? []).indices, id: \.self) { index in
                        if let cueTime = schedule_settings.day_schedules[day]?[index] {
                            ScheduleRow(cueTime: cueTime, day: day, index: index)
                        }
                    }
                    .onDelete(perform: { indices in
                        deleteTimes(at: indices, for: day)
                    })
                }
            }
        }
      }

      private func deleteTimes(at offsets: IndexSet, for day: String) {
          offsets.forEach { index in
              schedule_settings.removingCueingTime(for: day, at: index)
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
              
              Button("Edit"){
                  schedule_settings.chosen_day = day
                  schedule_settings.scheduled_hour = cueTime.hour
                  schedule_settings.scheduled_min = cueTime.min
                  navigationCoordinator.navigate(to: .timeOfDay, with: .edit(index))
              }
          }
      }
  }


struct EditScheduleView_Preview: PreviewProvider {
        static var previews: some View {
            EditScheduleView()
                .environmentObject(NavigationCoordinator())
                .environmentObject(ScheduledCueingSettings())
        }
}
