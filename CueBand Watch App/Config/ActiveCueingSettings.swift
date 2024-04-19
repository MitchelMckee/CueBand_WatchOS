//
//  Settings.swift
//  CueBand Watch App
//
//  Created by Mitchel Mckee on 05/04/2024.
//

import Foundation
import WatchKit

class ActiveCueingSettings: ObservableObject {
    
    @Published var cueing_length: Int = 10 {
        didSet {
            time_remaining = cueing_length * 60 // Change to mins
        }
    }
    @Published var cue_interval: Int = 5
    @Published var cue_style: Int = 1
    @Published var time_remaining: Int = 3600 // Default to an hour
    @Published var finished_cueing = false
    
    private var timer: Timer?
    private var time_since_last_cue = 0
    
    func startCueing() {
        finished_cueing = false
        print("Cues Per Min: ", cue_interval)
        print("Cue Style: ", cue_style)
        
        if timer == nil {
            time_remaining = cueing_length * 60
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
                self?.timerTick()
            }
        }
    }
        
    func stopCueing() {
            timer?.invalidate()
            timer = nil
        }
        
    private func timerTick(){
        if time_remaining > 0 {
            time_remaining -= 1000
            time_since_last_cue += 1
            
            if time_since_last_cue >= cue_interval {
                time_since_last_cue = 0
                triggerVibrations(repeatCount: cue_style)
            }
            
        } else {
            scheduleCompletionNotification()
            finished_cueing = true
            stopCueing()
        }
    }
    
    func triggerVibrations(repeatCount: Int){
        print("Triggering Vibrations")
        let vibInterval = 0.4 // Small interval to stop vibrations stacking
            for i in 0..<repeatCount {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * vibInterval) {
                    WKInterfaceDevice.current().play(.notification)
                }
            }
        }
}


