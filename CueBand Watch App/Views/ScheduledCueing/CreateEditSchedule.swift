//
//  CreateEditScheduleScreen.swift
//  CueBand Watch App
//
//  Created by Mitchel Mckee on 20/03/2024.
//

import SwiftUI

struct CreateEditSchedule: View {
    @EnvironmentObject var schedule_settings: ScheduledCueingSettings
    @EnvironmentObject var navigationCoordinator: NavigationCoordinator
    
    var body: some View {
        
        let screen_bounds = WKInterfaceDevice.current().screenBounds
        let max_button_width = screen_bounds.width * 0.9
        let spacing = screen_bounds.width * 0.01
        
        VStack(spacing: spacing) {
        
            Spacer()
            if schedule_settings.day_schedules.contains(where: { !$0.value.isEmpty }) {
                Button("Edit Schedule") {
                    schedule_settings.creating_schedule = false
                    navigationCoordinator.navigate(to: .daysOfWeek)
                }
                .multilineTextAlignment(.center)
                .buttonStyle(CustomButtonStyle(color: .black, textColor: .white, width: max_button_width * 0.8, height: 60, radius: 20))
                .font(.title3)
                .bold()
            }
            
            Spacer()
                        
            Button("Create Schedule") {
                trigger_haptic()
                schedule_settings.creating_schedule = true
                navigationCoordinator.navigate(to: .daysOfWeek)
            }
            .multilineTextAlignment(.center)
            .buttonStyle(CustomButtonStyle(color: .black, textColor: .white, width: max_button_width * 0.8, height: 60, radius: 20))
            .font(.title3)
            .bold()
                        
            Spacer()
            
            Button("Back") {
                trigger_haptic()
                navigationCoordinator.navigate(to: .start)
            }
            .multilineTextAlignment(.center)
            .buttonStyle(CustomButtonStyle(color: .black, textColor: .white, width: max_button_width * 0.3, height: 40, radius: 20))
            .font(.subheadline)
            .bold()
     
        }
        .padding(.bottom) // For smaller screens
        .frame(maxWidth: .infinity) // To avoid black bars
        .background(Color.white)
        }
      }

struct CreateEditSchedule_Preview: PreviewProvider {
    static var previews: some View {
        CreateEditSchedule()
            .environmentObject(NavigationCoordinator())
            .environmentObject(ActiveCueingSettings())
            .environmentObject(ScheduledCueingSettings())
    }
}
