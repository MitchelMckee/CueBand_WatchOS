//
//  DaysOfWeek.swift
//  CueBand Watch App
//
//  Created by Mitchel Mckee on 13/04/2024.
//

import SwiftUI

struct DaysOfWeek: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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

