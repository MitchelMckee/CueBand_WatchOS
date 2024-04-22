//
//  NavigationCoordinator.swift
//  CueBand Watch App
//
//  Created by Mitchel Mckee on 04/04/2024.
//

import Foundation
import SwiftUI

class NavigationCoordinator: ObservableObject {
    @Published var currentPage: Page = .start
    
    enum Page {
        case start
        case cuesPerMinute
        case scheduleTimeOfDay
        case createEditSchedule
        case vibrationInterval
        case timeOfDay
        case cueingLength
        case activeCueing
        case daysOfWeek
        case editSchedule
        case editDaySchedule
    }
    
    func navigate(to page: Page) {
            self.currentPage = page
    }
}

