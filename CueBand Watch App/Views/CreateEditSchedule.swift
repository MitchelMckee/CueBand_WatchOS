//
//  CreateEditScheduleScreen.swift
//  CueBand Watch App
//
//  Created by Mitchel Mckee on 20/03/2024.
//

import SwiftUI

struct CreateEditSchedule: View {
    @EnvironmentObject var navigationCoordinator: NavigationCoordinator
    
    var body: some View {
        
        let screen_bounds = WKInterfaceDevice.current().screenBounds
        let max_button_width = screen_bounds.width * 0.9
        let spacing = screen_bounds.width * 0.2
        
        VStack(spacing: spacing) {
                  Spacer()
                  Button("Edit Schedule") {
                      navigationCoordinator.navigate(to: .cuesPerMinute)
                  }
                  .multilineTextAlignment(.center)
                  .buttonStyle(CustomButtonStyle(color: .black, textColor: .white, width: max_button_width * 0.8, height: 60, radius: 20))
                  .font(.title3)
                  .bold()
                  
                  
                  Button("Create Schedule") {
                      navigationCoordinator.navigate(to: .scheduleTimeOfDay)
                  }
                  .multilineTextAlignment(.center)
                  .buttonStyle(CustomButtonStyle(color: .black, textColor: .white, width: max_button_width * 0.8, height: 60, radius: 20))
                  .font(.title3)
                  .bold()
                  
                  Spacer()
              }

              .frame(maxWidth: .infinity, maxHeight: .infinity)
              .edgesIgnoringSafeArea(.all)
              .background(Color.white)
          }
      }

struct CreateEditSchedule_Preview: PreviewProvider {
    static var previews: some View {
        CreateEditSchedule()
            .environmentObject(NavigationCoordinator())
            .environmentObject(ActiveCueingSettings())
    }
}
