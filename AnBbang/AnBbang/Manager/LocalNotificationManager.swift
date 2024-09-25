//
//  LocalNotificationManager.swift
//  AnBbang
//
//  Created by Jaemin Hong on 9/25/24.
// 

import Foundation
import UserNotifications

struct Notification {
    let id: String
    let title: String
    let body: String
    let notificationDate: DateComponents
}

@Observable
final class LocalNotificationManager {
    static let shared: LocalNotificationManager = LocalNotificationManager()
    var isSetNotificationAuth: Bool = false
    private var notifications: [Notification] = []
    
    private init() {
        
    }
    
    func resetNotificationAuthSetting() {
        isSetNotificationAuth = false
    }
    
    func requestPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { [weak self] granted, error in
            if error != nil {
                print("Error: \(error!.localizedDescription)")
            }
            
            self?.isSetNotificationAuth = true
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
    
    func addNewNotification(notification: Notification) {
        notifications.append(notification)
    }
    
    func deleteNotification(id: String) {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [id])
        notifications.removeAll(where: { $0.id ==  id })        
    }
    
    private func scheduleNotifications() {
        notifications.forEach { notification in
            let content = UNMutableNotificationContent()
            content.title = notification.title
            content.subtitle = "안방 매물 알림"
            content.body = notification.body
            content.sound = .default
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: notification.notificationDate, repeats: true)
            let request = UNNotificationRequest(identifier: notification.id, content: content, trigger: trigger)
            
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
