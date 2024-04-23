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
        
        let screen_bounds = WKInterfaceDevice.current().screenBounds
        let max_button_width = screen_bounds.width * 0.9
        
        let day = schedule_settings.edit_chosen_day
        let cueTimes = schedule_settings.day_schedules[day] ?? []
        
        VStack {
            
            if cueTimes.isEmpty {
                Text("No sessions scheduled!")
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
            } else {
                
                ScrollView {
                    ForEach(0..<cueTimes.count, id: \.self) { index in
                        let cueTime = cueTimes[index]
                        ScheduleRow(cueTime: cueTime, day: day, index: index)
                            .environmentObject(schedule_settings)
                            .environmentObject(navigationCoordinator)
                    }
                }
            }
            Button("Back"){
                navigationCoordinator.navigate(to: .daysOfWeek)
            }
            .multilineTextAlignment(.center)
            .buttonStyle(CustomButtonStyle(color: .black, textColor: .white, width: max_button_width * 0.3, height: 20, radius: 20))
            .font(.subheadline)
            .bold()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}


struct ScheduleRow: View {
    
    @EnvironmentObject var navigationCoordinator: NavigationCoordinator
    @EnvironmentObject var schedule_settings: ScheduledCueingSettings
    
    var cueTime: ScheduledCueingSettings.CueTime
    var day: String
    var index: Int
          
    var body: some View {
        
        let screen_bounds = WKInterfaceDevice.current().screenBounds
        let max_button_width = screen_bounds.width * 0.9
        
        HStack {
    
            Button(action: {
                schedule_settings.prepareForEditing(day: day, hour: cueTime.hour, min: cueTime.min, index: index)
//                schedule_settings.chosen_day = day
//                schedule_settings.scheduled_hour = cueTime.hour
//                schedule_settings.scheduled_min = cueTime.min
                navigationCoordinator.navigate(to: .timeOfDay)
            }) {
                Image(systemName: "pencil")
            }
            .buttonStyle(CustomButtonStyle(color: .black, textColor: .white, width: max_button_width * 0.3, height: 40, radius: 20))
            
            Text("\(cueTime.hour):\(String(format: "%02d", cueTime.min))")
                .foregroundColor(Color.black)
                .frame(minWidth: screen_bounds.width * 0.3)
               
            Button(action: { 
                print("Deleted entry")
                schedule_settings.removingCueingTime(for: day, at: index)
            }) {
                Image(systemName: "xmark")
            }
            .buttonStyle(CustomButtonStyle(color: .black, textColor: .white, width: max_button_width * 0.3, height: 40, radius: 20))
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
