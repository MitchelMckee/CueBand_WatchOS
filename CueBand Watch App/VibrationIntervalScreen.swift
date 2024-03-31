//
//  VibrationIntervalScreen.swift
//  CueBand Watch App
//
//  Created by Mitchel Mckee on 29/03/2024.
//

import SwiftUI

struct VibrationIntervalScreen: View {
    @State private var setting = 5
    @State private var increment_amount = 30
    @State private var radius_amount = CGFloat(60)
    @State private var object_color = Color.black

    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Button(action: {
                    if setting > 5  {
                        self.setting -= increment_amount
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

                Text("every "+"\(setting)"+" seconds")
                    .font(.caption2)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(width: 70, height: 60)
                    .background(Rectangle().fill(object_color).cornerRadius(radius_amount).shadow(radius: radius_amount))

                Spacer()

                Button(action: {
                    if setting >= 240 {
                        self.setting = self.setting
                    } else {
                        self.setting += increment_amount
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
    VibrationIntervalScreen()
}