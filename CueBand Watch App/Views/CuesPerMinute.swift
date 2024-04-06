//
//  ActiveCueingScreen.swift
//  CueBand Watch App
//
//  Created by Mitchel Mckee on 11/03/2024.
//

import SwiftUI

struct CuesPerMinute: View {
    @EnvironmentObject var navigationCoordinator: NavigationCoordinator
    @EnvironmentObject var settings: ActiveCueingSettings
    @State private var increment_amount = 1
    @State private var radius_amount = CGFloat(60)
    @State private var object_color = Color.black

    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Button(action: {
                    if settings.cues_per_minute > 1  {
                        self.settings.cues_per_minute -= increment_amount
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
                
                Text("x"+"\(settings.cues_per_minute)")
                    .font(.largeTitle)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(width: 70, height: 60)
                    .background(Rectangle().fill(object_color).cornerRadius(radius_amount).shadow(radius: radius_amount))
                
                Spacer()
                
                Button(action: {
                    if settings.cues_per_minute >= 6 {
                        self.settings.cues_per_minute = self.settings.cues_per_minute
                    } else {
                        self.settings.cues_per_minute += increment_amount
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
                    navigationCoordinator.navigate(to: .start)
                }) {
                    Text("Back")
                        .font(.title3)
                        .padding()
                        .background(Rectangle().fill(object_color).cornerRadius(10))
                }
                
                Spacer()
                
                Button(action: {
                    navigationCoordinator.navigate(to: .cueingLength)
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

struct CuesPerMinute_Preview: PreviewProvider {
    static var previews: some View {
        CuesPerMinute()
            .environmentObject(NavigationCoordinator())
            .environmentObject(ActiveCueingSettings())
    }
}
