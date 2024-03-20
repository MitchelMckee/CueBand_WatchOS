//
//  ActiveCueingScreen.swift
//  CueBand Watch App
//
//  Created by Mitchel Mckee on 11/03/2024.
//

import SwiftUI

struct ActiveCueingScreen: View {
    @State private var timeRemaining = 3600 // 1 hour in seconds
    @State private var timerIsActive = false
    @State private var radius_amount = CGFloat(60)
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
       
        VStack(spacing: 20) {
           
// Timer ---------------------------------------------------------------------------------------
            Text(formatTime(time: timeRemaining))
                .font(.largeTitle)
                .padding()
                .frame(minWidth: 0, maxWidth: .infinity)
                .onReceive(timer) { _ in
                    if self.timeRemaining > 0 && self.timerIsActive {
                        self.timeRemaining -= 1
                    }
                }
                
            HStack(spacing: 50) {
                
// Stop Button ---------------------------------------------------------------------------------
                Button(action: {
                    self.timerIsActive = false
                }) {
                    Text("🛑")
                        .font(.caption)
                        .padding()
                }

// Settings Button -----------------------------------------------------------------------------
                Button(action: {
                    // Navigate to settings or perform settings action
                }) {
                    Text("⚙️")
                        .font(.caption)
                        .padding()
                }
            }
        }
        .padding()
        // Start timer
        .onAppear() {
            self.timerIsActive = true
        }
    }
    
// Format time from seconds to HH:mm:ss --------------------------------------------
    private func formatTime(time: Int) -> String {
        let hours = time / 3600
        let minutes = (time % 3600) / 60
        let seconds = (time % 3600) % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}

struct ActiveCueingScreen_Previews: PreviewProvider {
    static var previews: some View {
        ActiveCueingScreen()
    }
}
