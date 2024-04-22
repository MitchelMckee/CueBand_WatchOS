//
//  ScheduledCueingSettings.swift
//  CueBand Watch App
//
//  Created by Mitchel Mckee on 13/04/2024.
//

import Foundation

class ScheduledCueingSettings: ObservableObject {
    
    struct CueTime: Codable, Equatable, Hashable{
        var hour: Int
        var min: Int
    }
    
    @Published var chosen_time_of_day: Int = 0 {
        didSet {
            switch chosen_time_of_day {
            case 0: scheduled_hour = 6
            case 1: scheduled_hour = 12
            case 2: scheduled_hour = 18
            default: scheduled_hour = 6
            }
        }
    }
    
    @Published var chosen_day: String = "Monday" // default set to Monday, this is for create schedule
    @Published var edit_chosen_day: String = "Monday" // this is for edit schedule
    
    @Published var times_of_day: [String] = ["Morning", "Afternoon", "Evening"]
    @Published var days_of_week: [String] = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    @Published var day_schedules: [String: [CueTime]] = [:]
    
    @Published var scheduled_hour: Int = 10
    @Published var scheduled_min: Int = 10
    
    init(){
        loadFromUserDefaults()
    }
    
    func addCueingTime(for day: String, hour: Int, min: Int){
        let new_time = CueTime(hour: hour, min: min)
        day_schedules[day, default: []].append(new_time)
        saveToUserDefaults()
    }
    
    func removingCueingTime(for day: String, at index: Int){
        guard day_schedules[day] != nil else { return }
        day_schedules[day]!.remove(at: index)
        saveToUserDefaults()
    }
    
    private func saveToUserDefaults(){
        if let encodedData = try? PropertyListEncoder().encode(day_schedules) {
            UserDefaults.standard.set(try? PropertyListEncoder().encode(day_schedules), forKey: "day_schedules")
        }
    }
    
    private func loadFromUserDefaults(){
        if let data = UserDefaults.standard.data(forKey: "day_schedules"),
           let schedules = try? PropertyListDecoder().decode(Dictionary<String, [(CueTime)]>.self, from: data) {
            day_schedules = schedules
        }
    }
}
