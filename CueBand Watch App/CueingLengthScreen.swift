//
//  CueingLengthScreen.swift
//  CueBand Watch App
//
//  Created by Mitchel Mckee on 20/03/2024.
//

import SwiftUI

struct CueingLengthScreen: View {
    @State private var setting = 0
    @State private var increment_amount = 10
    @State private var radius_amount = CGFloat(60)
    @State private var object_color = Color.black
    @State private var current_time = Date()
    
    private var finish_time: Date {
            return Calendar.current.date(byAdding: .minute, value: setting, to: current_time)!
        }
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    
    var body: some View {
        
        VStack(spacing: 20) {
            Text(finish_time, style: .time)
                .onReceive(timer) { input in
                    current_time = input
                }
                .font(.title3)
                .fixedSize(horizontal: false, vertical: true)
                .frame(width: 100, height: 30)
                .background(Rectangle().fill(object_color).cornerRadius(radius_amount).shadow(radius: radius_amount))
            HStack {
                Button(action: {
                    if setting != 0 {
                        setting = max(0, setting - increment_amount)
                    }
                }) {
                    Text("➖")
                        .font(.title2)
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.center)
                        .frame(width: 50, height: 40)
                        .background(Rectangle().fill(object_color).cornerRadius(radius_amount).shadow(radius: radius_amount))
                }

                Spacer()

                Text("\(setting)"+"\nmins")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(width: 80, height: 60)
                    .background(Rectangle().fill(object_color).cornerRadius(radius_amount).shadow(radius: radius_amount))

                Spacer()

                Button(action: {
                    if setting < 60{
                        setting += increment_amount
                    }
                }) {
                    Text("➕")
                        .font(.title2)
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.center)
                        .frame(width: 50, height: 40)
                        .background(Rectangle().fill(object_color).cornerRadius(radius_amount).shadow(radius: radius_amount))
                }
            }

            Spacer()

            HStack {
                Button(action: {
                    // Action for Back Button
                }) {
                    Text("Back")
                        .font(.title3)
                        .padding()
                        .background(Rectangle().fill(object_color).cornerRadius(10))
                }

                Spacer()

                Button(action: {
                    // Action for Next Button
                }) {
                    Text("Start")
                        .font(.title3)
                        .padding()
                        .background(Rectangle().fill(object_color).cornerRadius(10))
                }
            }
        }
        .padding()
        .background(Color.white)
    }
}

#Preview {
    CueingLengthScreen()
}

