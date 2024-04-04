//
//  ContentView.swift
//  CueBand Watch App
//
//  Created by Mitchel Mckee on 11/02/2024.
//

import SwiftUI

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
