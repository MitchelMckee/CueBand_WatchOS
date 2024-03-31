//
//  ScheduleTimeOfDayScreen.swift
//  CueBand Watch App
//
//  Created by Mitchel Mckee on 29/03/2024.
//

import SwiftUI

struct ScheduleTimeOfDayScreen: View {
    @State private var setting = 0
    @State private var times_of_day = ["Morning", "Afternoon", "Evening"]
    @State private var increment_amount = 1
    @State private var radius_amount = CGFloat(60)
    @State private var object_color = Color.black

    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Button(action: {
                    self.setting = (self.setting - 1 + times_of_day.count) % times_of_day.count
                }) {
                    Text("➖")
                        .font(.title2)
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.center)
                        .frame(width: 50, height: 40)
                        .background(Rectangle().fill(object_color).cornerRadius(radius_amount).shadow(radius: radius_amount))
                }

                Spacer()

                Text(times_of_day[setting])
                    .font(.caption)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(width: 70, height: 60)
                    .background(Rectangle().fill(object_color).cornerRadius(radius_amount).shadow(radius: radius_amount))

                Spacer()

                Button(action: {
                    self.setting = (self.setting + 1) % times_of_day.count
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
                    Text("Next")
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
    ScheduleTimeOfDayScreen()
}
