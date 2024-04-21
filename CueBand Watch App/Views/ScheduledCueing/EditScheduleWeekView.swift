//
//  EditScheduleView.swift
//  CueBand Watch App
//
//  Created by Mitchel Mckee on 20/04/2024.
//

import SwiftUI

struct EditScheduleWeekView: View {
    @EnvironmentObject var navigationCoordinator: NavigationCoordinator
    @EnvironmentObject var schedule_settings: ScheduledCueingSettings
    
    @State private var radius_amount = CGFloat(60)
    @State private var object_color = Color.black
    
    @State private var selectedDayIndex = 0
    
    var body: some View {
            
        VStack {
            HStack {
                Button(action: {
                    selectedDayIndex = max(0, selectedDayIndex - 1)
                }) {
                    Image(systemName: "chevron.left")
                }
                .disabled(selectedDayIndex <= 0)
                .frame(width: 40, height: 40)
                
                Spacer()
                
                Text(schedule_settings.days_of_week[selectedDayIndex])
                    .font(.caption2)
                
                Spacer()
                
                Button(action: {
                    selectedDayIndex = max(0, selectedDayIndex + 1)
                }) {
                    Image(systemName: "chevron.right")
                }
                .disabled(selectedDayIndex >= schedule_settings.days_of_week.count - 1)
                .frame(width: 40, height: 40)
                
            }
        }
        
        Button("Back") {
            navigationCoordinator.navigate(to: .createEditSchedule)
            }
    }

}

//  struct ScheduleRow: View {
//      
//      @EnvironmentObject var navigationCoordinator: NavigationCoordinator
//      @EnvironmentObject var schedule_settings: ScheduledCueingSettings
//      
//      var cueTime: ScheduledCueingSettings.CueTime
//      var day: String
//      var index: Int
//            
//      var body: some View {
//          
//          
//          HStack {
//              Text("\(cueTime.hour):\(String(format: "%02d", cueTime.min))")
//              Spacer()
//              
//              Button("Edit") {
//                  schedule_settings.chosen_day = day
//                  schedule_settings.scheduled_hour = cueTime.hour
//                  schedule_settings.scheduled_min = cueTime.min
//                  navigationCoordinator.navigate(to: .timeOfDay)
//              }
//          }
//      }
//  }


struct EditScheduleWeekView_Preview: PreviewProvider {
        static var previews: some View {
            EditScheduleWeekView()
                .environmentObject(NavigationCoordinator())
                .environmentObject(ScheduledCueingSettings())
        }
}
