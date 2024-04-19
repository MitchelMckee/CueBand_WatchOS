//
//  TimeOfDayScreen.swift
//  CueBand Watch App
//
//  Created by Mitchel Mckee on 20/03/2024.
//

import SwiftUI

struct TimeOfDay: View {
    @EnvironmentObject var navigationCoordinator: NavigationCoordinator
    @EnvironmentObject var settings: ActiveCueingSettings
    @EnvironmentObject var schedule_settings: ScheduledCueingSettings
    
//    @State private var setting = 5
    @State private var radius_amount = CGFloat(60)
    @State private var object_color = Color.black

    
    @State private var editing_hour = true
    @State private var max_hours = 23
    @State private var max_mins = 58

    var body: some View {
        
        
        private var selected_day = schedule_settings
                
        let screen_bounds = WKInterfaceDevice.current().screenBounds
        let spacing = screen_bounds.height * 0.02
        let buttonWidth = screen_bounds.width * 0.3
        let buttonHeight = screen_bounds.height * 0.2
        
        
        VStack(spacing: spacing) {
        
            Text("\(String(format: "%02d:%02d", schedule_settings.scheduled_hour, schedule_settings.scheduled_min))")
                            .font(.title3)
                            .fixedSize(horizontal: false, vertical: true)
                            .frame(width: 100, height: 30)
                            .background(Rectangle().fill(object_color).cornerRadius(radius_amount).shadow(radius: radius_amount))

            HStack {
                Button(action: {
                    if editing_hour {
                        if schedule_settings.scheduled_hour > 0 {
                            schedule_settings.scheduled_hour -= 1
                        }
                    } else {
                        if schedule_settings.scheduled_min >= 5 {
                            schedule_settings.scheduled_min -= 5
                        } else {
                            schedule_settings.scheduled_min = 55
                            schedule_settings.scheduled_hour = max(0, schedule_settings.scheduled_hour - 1)
                            }
                    }
                }) {
                    Text("➖")
                        .font(.title2)
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.center)
                        .frame(width: buttonWidth * 0.8, height: buttonHeight)
                        .background(Rectangle().fill(object_color).cornerRadius(radius_amount).shadow(radius: radius_amount))
                }
                
                Spacer()
                
                Text(editing_hour ? String(format: "%02d", schedule_settings.scheduled_hour) : String(format: "%02d", schedule_settings.scheduled_min))
                    .font(.title2)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(width: 75, height: 60)
                    .background(Rectangle().fill(object_color).cornerRadius(radius_amount).shadow(radius: radius_amount))
                                        
                Spacer()
                
                Button(action: {
                    if editing_hour {
                        if schedule_settings.scheduled_hour < 23 {
                            schedule_settings.scheduled_hour += 1
                        }
                    } else {
                        if schedule_settings.scheduled_min < 55 {
                            schedule_settings.scheduled_min += 5
                        } else {
                            schedule_settings.scheduled_min = 0
                            if schedule_settings.scheduled_hour < 23 {
                                schedule_settings.scheduled_hour += 1
                            }
                        }
                    }
                }) {
                    Text("➕")
                        .font(.title2)
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.center)
                        .frame(width: buttonWidth * 0.8, height: buttonHeight)
                        .background(Rectangle().fill(object_color).cornerRadius(radius_amount).shadow(radius: radius_amount))
                }
            }
            
            Spacer()
            
            HStack {
                Button(action: {
                    if editing_hour {
                        navigationCoordinator.navigate(to: .scheduleTimeOfDay)
                    } else {
                        editing_hour = true
                    }
                   
                }) {
                    Text("Back")
                        .font(.title3)
                        .padding()
                        .frame(width: buttonWidth * 1.3, height: buttonHeight * 1.3)
                        .background(Rectangle().fill(object_color).cornerRadius(10))
                }
                
                Spacer()
                
                Button(action: {
                    saveTime()
                }) {
                    Text("Save")
                        .font(.title3)
                        .padding()
                        .frame(width: buttonWidth * 1.3, height: buttonHeight * 1.3)
                        .background(Rectangle().fill(object_color).cornerRadius(10))
                }
            }
        }
        .padding()
        .background(Color.white)
    }
    
    private func saveTime(){
        schedule_settings.addCueingTime(for: selected_day, hour: schedule_settings.scheduled_hour, min: schedule_settings.scheduled_min)
    }
}

struct TimeOfDay_Preview: PreviewProvider {
        static var previews: some View {
            TimeOfDay()
                .environmentObject(NavigationCoordinator())
                .environmentObject(ActiveCueingSettings())
                .environmentObject(ScheduledCueingSettings())
        }
}

