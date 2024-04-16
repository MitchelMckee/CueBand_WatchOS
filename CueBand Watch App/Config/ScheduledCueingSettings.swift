//
//  ScheduledCueingSettings.swift
//  CueBand Watch App
//
//  Created by Mitchel Mckee on 13/04/2024.
//

import Foundation


class ScheduledCueingSettings: ObservableObject {
    @Published var chosen_time_of_day: Int = 0 {
        didSet {
            switch chosen_time_of_day {
            case 0:
                scheduled_hour = 6
            case 1:
                scheduled_hour = 12
            case 2:
                scheduled_hour = 18
            default:
                scheduled_hour = 6
            }
        }
    }
    @Published var times_of_day: [String] = ["Morning", "Afternoon", "Evening"]
    @Published var days_of_week: [String] = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    @Published var scheduled_hour: Int = 10
    @Published var scheduled_min: Int = 10
}
