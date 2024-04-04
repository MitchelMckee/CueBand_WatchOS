//
//  ActiveCueingScreen.swift
//  CueBand Watch App
//
//  Created by Mitchel Mckee on 11/03/2024.
//

import SwiftUI
import WatchKit

struct ActiveCueing: View {
    @EnvironmentObject var navigationCoordinator: NavigationCoordinator
    @State private var time_remaining = 3600
    @State private var timer_is_active = false
    @State private var radius_amount = CGFloat(10)
    @State private var cueing_style = 3
    @State private var cueing_rate = 30
    @State private var time_since_last_cue = 0
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
       
        VStack(spacing: 10) {
           
// Timer ---------------------------------------------------------------------------------------
            Text(formatTime(time: time_remaining))
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(Color.white)
                .padding()
                .background(Color.black)
                .cornerRadius(radius_amount)
                .frame(width: /*@START_MENU_TOKEN@*/180.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                .shadow(radius: 10)
                .onReceive(timer) { _ in
                    if self.time_remaining > 0 && self.timer_is_active {
                        self.time_remaining -= 1
                        self.time_since_last_cue += 1
                        
                        if self.time_since_last_cue >= cueing_rate{
                            self.time_since_last_cue = 0
                            self.triggerVibrations(repeatCount: self.cueing_style)
                        }
                    }
                    

                }
                
            HStack(spacing: 40) {
                
// Stop Button ---------------------------------------------------------------------------------
                Button(action: {
                    self.timer_is_active = false
                }) {
                
                    Text("🛑")
                        .font(.title2)
                }
                .buttonStyle(CustomButtonStyle(color: .black, textColor: .white))

// Settings Button -----------------------------------------------------------------------------
                Button(action: {
                    self.timer_is_active = true
                }) {
                    Text("⚙️")
                        .font(.title2)

                }
                .buttonStyle(CustomButtonStyle(color: .black, textColor: .white))
            }
        }
        .padding()
        .background(Color.white)
        // Start timer
        .onAppear() {
            self.timer_is_active = true
        }
    }
    
// Format time from seconds to HH:mm:ss --------------------------------------------
private func formatTime(time: Int) -> String {
    let hours = time / 3600
    let minutes = (time % 3600) / 60
    let seconds = (time % 3600) % 60
    return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
private func triggerVibrations(repeatCount: Int){
    for _ in 0..<repeatCount {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            WKInterfaceDevice.current().play(.click)
            }
        }
    }
}


struct CustomButtonStyle: ButtonStyle {
    var color: Color
    var textColor: Color
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .shadow(radius: 10)
            .frame(width: 60, height: 60)
            .background(color)
            .foregroundColor(textColor)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .scaleEffect(configuration.isPressed ? 0.8 : 1.0)
            .animation(.easeOut, value: configuration.isPressed)
    }
}

struct ActiveCueingScreen_Previews: PreviewProvider {
    static var previews: some View {
        ActiveCueing()
    }
}
