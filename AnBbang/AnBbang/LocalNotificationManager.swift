//
//  LocalNotificationManager.swift
//  AnBbang
//
//  Created by Jaemin Hong on 9/25/24.
// 

import Foundation
import UserNotifications

struct Notification: Identifiable {
    let id: UUID = UUID()
    let title: String
    let body: String
}

final class LocalNotificationManager {
    static let shared: LocalNotificationManager = LocalNotificationManager()
    private(set) var isAuthorized: Bool = false
    private var notifications: [Notification] = [
        Notification(title: "Hello", body: "World"),
        Notification(title: "The", body: "World"),
        Notification(title: "Time to buy!", body: "사세요오"),
    ]
    
    private init() {
        
    }
    
    func requestPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { [weak self] granted, error in
            if error != nil {
                print("Error: \(error!.localizedDescription)")
            }
            
            if granted {
                self?.isAuthorized = true
                print("true")
            }
        }
    }
    
    func setSchedule() {
        UNUserNotificationCenter.current().getNotificationSettings { [weak self] settings in
            switch settings.authorizationStatus {
            case .authorized:
                print("A")
                self?.scheduleNotifications()
            default:
                break
            }
        }
    }
    
    func addNewNotification(title: String, body: String) {
        notifications.append(Notification(title: title, body: body))
    }
    
    private func scheduleNotifications() {
        notifications.forEach { notification in
            var dateComponents = DateComponents()
            dateComponents.calendar = Calendar.current
            dateComponents.weekday = Calendar.current.component(.weekday, from: Date())
            dateComponents.hour = Calendar.current.component(.hour, from: Date())
            
            let content = UNMutableNotificationContent()
            content.title = notification.title
            content.subtitle = "안방 매물 알림"
            content.body = notification.body
            content.sound = .default
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
            let request = UNNotificationRequest(identifier: notification.id.uuidString, content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request) { error in
                if error != nil {
                    print("Error: \(error!.localizedDescription)")
                } else {
                    print("Add success")
                }
            }
        }
    }
}
