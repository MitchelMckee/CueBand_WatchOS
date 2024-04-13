//
//  Settings.swift
//  CueBand Watch App
//
//  Created by Mitchel Mckee on 05/04/2024.
//

import Foundation

class ActiveCueingSettings: ObservableObject {
    @Published var cueing_length: Int = 10 // Changed by user input
    @Published var time_remaining: Int = 3600 // Changed by timer
    
    private var timer: Timer?
    
    @Published var cueing_interval: Int = 0
    @Published var cues_per_minute: Int = 1
    
    func startCueing() {
         self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
             guard let self = self else { return }
             if self.time_remaining > 0 {
                 self.time_remaining -= 1
             } else {
                 self.stopCueing()
             }
         }
     }
    
    func stopCueing() {
           self.timer?.invalidate()
           self.timer = nil
       }
}



