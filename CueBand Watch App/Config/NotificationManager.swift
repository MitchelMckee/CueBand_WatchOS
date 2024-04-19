//
//  NotificationManager.swift
//  CueBand Watch App
//
//  Created by Mitchel Mckee on 19/04/2024.
//

import Foundation
import UserNotifications

func requestNotificationPermission(){
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
        if granted {
            print("Notifications enabled")
        } else if let error = error {
            print("Notification error: \(error.localizedDescription)")
        }
    }
}

func scheduleCompletionNotification() {
    let content = UNMutableNotificationContent()
    content.title = "Cueing Complete"
    content.body = "Your cueing session has finished."
    content.sound = UNNotificationSound.default

    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
    let request = UNNotificationRequest(identifier: "cueingComplete", content: content, trigger: trigger)

    UNUserNotificationCenter.current().add(request) { error in
        if let error = error {
            print("Error scheduling notification: \(error)")
        }
    }
}

