//
//  ContentView.swift
//  CueBand Watch App
//
//  Created by Mitchel Mckee on 11/02/2024.
//

import SwiftUI

@main
struct CueBandApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationLink(destination: SettingsView()){
                Text("Start")
            }
        }
    }
}


#Preview {
    ContentView()
}
