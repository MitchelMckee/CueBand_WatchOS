//
//  Settings.swift
//  CueBand Watch App
//
//  Created by Mitchel Mckee on 05/04/2024.
//

import Foundation

class ActiveCueingSettings: ObservableObject {
    
    @Published var cueing_length: Int = 10 {
        didSet {
            time_remaining = cueing_length * 60 // Change to mins
        }
    }
    @Published var cues_per_minute: Int = 5
    @Published var cue_style: Int = 1
    @Published var time_remaining: Int = 3600 // Default to an hour
    
    private var timer: Timer?
    
    func startCueing() {
        time_remaining = cueing_length * 60
        if timer == nil {
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
                guard let self = self else { return }
                if time_remaining > 0 {
                    time_remaining -= 1
                } else {
                    stopCueing()
                }
            }
        }
    }
    
    func stopCueing() {
           timer?.invalidate()
           timer = nil
       }
}



