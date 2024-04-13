//
//  ScheduledCueingSettings.swift
//  CueBand Watch App
//
//  Created by Mitchel Mckee on 13/04/2024.
//

import Foundation


class ScheduledCueingSettings: ObservableObject {
    @Published var chosen_time_of_day: Int = 0 // index of times_of_day
    @Published var times_of_day: [String] = ["Morning", "Afternoon", "Evening"]
    @Published var scheduled_hour: Int = 10
    @Published var scheduled_min: Int = 10
}
