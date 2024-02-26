//
//  SettingsView.swift
//  CueBand Watch App
//
//  Created by Mitchel Mckee on 26/02/2024.
//

import SwiftUI

struct SettingsView: View {
    @State private var setting = 10
    @State private var increment_amount = 5
    private var object_color = Color.red

    var body: some View {
        VStack {
            Button(action: {
                self.setting += increment_amount
            }) {
                Text("↑")
                    .font(.title2)
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
                    .frame(width: 50, height: 40)
                    .background(Rectangle().fill(object_color).cornerRadius(33).shadow(radius: 33))
            }

            Text("\(setting)")
                .font(.largeTitle)
                .fixedSize(horizontal: false, vertical: true)
                .frame(width: 140, height: 80)
                .background(Rectangle().fill(object_color).cornerRadius(33).shadow(radius: 33))

            Button(action: {
                self.setting -= increment_amount
            }) {
                Text("↓")
                    .font(.title2)
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
                    .frame(width: 50, height: 40)
                    .background(Rectangle().fill(object_color).cornerRadius(33).shadow(radius: 33))
            }
        }
        .background(Color.white)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
