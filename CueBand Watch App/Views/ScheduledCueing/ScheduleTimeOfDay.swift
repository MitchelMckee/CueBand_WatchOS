//
//  ScheduleTimeOfDayScreen.swift
//  CueBand Watch App
//
//  Created by Mitchel Mckee on 29/03/2024.
//

import SwiftUI

struct ScheduleTimeOfDay: View {
    @EnvironmentObject var navigationCoordinator: NavigationCoordinator
    @EnvironmentObject var schedule_settings: ScheduledCueingSettings
    
    @State private var setting = 0
    @State private var increment_amount = 1
    @State private var radius_amount = CGFloat(60)
    @State private var object_color = Color.black
    
    var body: some View {
        
        let screen_bounds = WKInterfaceDevice.current().screenBounds
        let buttonWidth = screen_bounds.width * 0.3
        let buttonHeight = screen_bounds.height * 0.2
        
        VStack(spacing: 10) {
            
            Text("Editing \(schedule_settings.chosen_day)")
                .font(.caption2)
                .fixedSize(horizontal: false, vertical: true)
                .frame(width: 150, height: 30)
                .background(Rectangle().fill(object_color).cornerRadius(radius_amount).shadow(radius: radius_amount))
            
            HStack {
                Button(action: {
                    self.setting = (self.setting - 1 + schedule_settings.times_of_day.count) % schedule_settings.times_of_day.count
                }) {
                    Image(systemName: "minus")
                        .font(.title2)
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.center)
                        .frame(width: buttonWidth * 0.8, height: buttonHeight)
                        .background(Rectangle().fill(object_color).cornerRadius(radius_amount).shadow(radius: radius_amount))
                }

                Spacer()

                Text(schedule_settings.times_of_day[setting])
                    .font(.caption)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(width: 70, height: 60)
                    .background(Rectangle().fill(object_color).cornerRadius(radius_amount).shadow(radius: radius_amount))

                Spacer()

                Button(action: {
                    self.setting = (self.setting + 1) % schedule_settings.times_of_day.count
                }) {
                    Image(systemName: "plus")
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
                    navigationCoordinator.navigate(to: .daysOfWeek)
                }) {
                    Text("Back")
                        .font(.title3)
                        .padding()
                        .frame(width: buttonWidth * 1.3, height: buttonHeight * 1.3)
                        .background(Rectangle().fill(object_color).cornerRadius(10))
                }

                Spacer()

                Button(action: {
                    schedule_settings.chosen_time_of_day = setting
                    navigationCoordinator.navigate(to: .timeOfDay)
                }) {
                    Text("Next")
                        .font(.title3)
                        .padding()
                        .frame(width: buttonWidth * 1.3, height: buttonHeight * 1.3)
                        .background(Rectangle().fill(object_color).cornerRadius(10))
                }
            }
        }
        .onAppear{
            setting = schedule_settings.chosen_time_of_day
        }
        .padding()
        .background(Color.white)
    }
}

struct ScheduleTimeOfDay_Preview: PreviewProvider {
        static var previews: some View {
            ScheduleTimeOfDay()
                .environmentObject(NavigationCoordinator())
                .environmentObject(ScheduledCueingSettings())
        }
}
