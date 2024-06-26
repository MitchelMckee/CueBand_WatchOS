//
//  DaysOfWeek.swift
//  CueBand Watch App
//
//  Created by Mitchel Mckee on 13/04/2024.
//

import SwiftUI

struct DaysOfWeek: View {
    @EnvironmentObject var navigationCoordinator: NavigationCoordinator
    @EnvironmentObject var schedule_settings: ScheduledCueingSettings
    
    @State private var setting = 0
    
    @State private var radius_amount = CGFloat(60)
    @State private var object_color = Color.black
    
    
    
    var body: some View {
        
        let screen_bounds = WKInterfaceDevice.current().screenBounds
        let buttonWidth = screen_bounds.width * 0.3
        let buttonHeight = screen_bounds.height * 0.2
        
        VStack(spacing: 20){
            HStack {
                
                Button(action: {
                    trigger_haptic()
                    self.setting = (self.setting - 1 + schedule_settings.days_of_week.count) % schedule_settings.days_of_week.count
                    print(self.setting)
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .fixedSize(horizontal: false, vertical: true)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .frame(width: buttonWidth * 0.7, height: buttonHeight)
                        .background(Rectangle().fill(object_color).cornerRadius(radius_amount).shadow(radius: radius_amount))
                }
                
                Text(schedule_settings.days_of_week[setting])
                    .font(.caption)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(width: 80, height: 60)
                    .background(Rectangle().fill(object_color).cornerRadius(radius_amount).shadow(radius: radius_amount))
                
                Button(action: {
                    trigger_haptic()
                    self.setting = (self.setting + 1) % schedule_settings.days_of_week.count
                }) {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                        .foregroundColor(Color.white)
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.center)
                        .frame(width: buttonWidth * 0.7, height: buttonHeight)
                        .background(Rectangle().fill(object_color).cornerRadius(radius_amount).shadow(radius: radius_amount))
                }
                
                Spacer()
                
            }
            
            HStack {
                Button(action: {
                    trigger_haptic()
                    navigationCoordinator.navigate(to: .createEditSchedule)
                }) {
                    Text("Back")
                        .font(.title3)
                        .padding()
                        .frame(width: buttonWidth * 1.3, height: buttonHeight * 1.3)
                        .background(Rectangle().fill(object_color).opacity(0.8).cornerRadius(10))
                }
                
                Spacer()
                
                Button(action: {
                    trigger_haptic()
                    if schedule_settings.creating_schedule == true {
                        schedule_settings.chosen_day = schedule_settings.days_of_week[setting]
                        navigationCoordinator.navigate(to: .scheduleTimeOfDay)
                    } else {
                        schedule_settings.edit_chosen_day = schedule_settings.days_of_week[setting]
                        navigationCoordinator.navigate(to: .editDaySchedule)
                    }
                }) {
                    if schedule_settings.creating_schedule == true {
                        Text("Next")
                            .font(.title3)
                            .padding()
                            .frame(width: buttonWidth * 1.3, height: buttonHeight * 1.3)
                            .background(Rectangle().fill(object_color).cornerRadius(10))
                    } else {
                        Text("Edit")
                            .font(.title3)
                            .padding()
                            .frame(width: buttonWidth * 1.3, height: buttonHeight * 1.3)
                            .background(Rectangle().fill(object_color).cornerRadius(10))
                    }
                }
            }
        }
        .padding()
        .background(Color.white)
    }
}

struct DaysOfWeek_Preview: PreviewProvider {
        static var previews: some View {
            DaysOfWeek()
                .environmentObject(NavigationCoordinator())
                .environmentObject(ActiveCueingSettings())
                .environmentObject(ScheduledCueingSettings())
        }
}

