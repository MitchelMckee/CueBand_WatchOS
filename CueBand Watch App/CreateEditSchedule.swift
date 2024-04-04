//
//  CreateEditScheduleScreen.swift
//  CueBand Watch App
//
//  Created by Mitchel Mckee on 20/03/2024.
//

import SwiftUI

struct CreateEditSchedule: View {
    @EnvironmentObject var navigationCoordinator: NavigationCoordinator
    var body: some View {
        VStack(spacing: 10){
            Button("Edit Schedule"){
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.black)
            .foregroundColor(.white)
            
            
            Button("New Schedule"){
                
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.black)
            
            
            Button(action: {
                
            }) {
                Text("Back")
                    .font(.title2)
                    .foregroundColor(Color.white)
                    .padding(.vertical)
            }
        }
            .padding()
            .background(Color.white)
//            .edgesIgnoringSafeArea(.all)
        }

}

#Preview {
    CreateEditSchedule()
}
