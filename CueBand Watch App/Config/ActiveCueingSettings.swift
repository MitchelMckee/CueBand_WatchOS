//
//  Settings.swift
//  CueBand Watch App
//
//  Created by Mitchel Mckee on 05/04/2024.
//

import Foundation

class ActiveCueingSettings: ObservableObject {
    @Published var cueing_length: Int = 0
    @Published var cueing_interval: Int = 0
    @Published var cues_per_minute: Int = 1
}

