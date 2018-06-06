//
//  Notification.swift
//  LocalNotifiction
//
//  Created by Daniel Hjärtström on 2018-03-06.
//  Copyright © 2018 Daniel Hjärtström. All rights reserved.
//

import UIKit
import UserNotifications

class Notification: NSObject, UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .badge, .sound])
    }
    
    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (completed, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
    
    func notify() {
        let content = UNMutableNotificationContent()
        content.title = "Potato shortage!"
        content.subtitle = "There are no potatoes left..."
        content.body = "People were horrified to learn that the last potato was eaten by a dog last night."
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "potatoNotification", content: content, trigger: trigger)
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }

}
