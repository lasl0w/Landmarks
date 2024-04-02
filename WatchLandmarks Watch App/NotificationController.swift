//
//  NotificationController.swift
//  WatchLandmarks Watch App
//
//  Created by tom montgomery on 3/16/24.
//
import WatchKit
import SwiftUI
import UserNotifications

class NotificationController: WKUserNotificationHostingController<NotificationsView> {
    
    var landmark: Landmark?
    var title: String?
    var message: String?
    
    //use the key to extrack the landmark index from the notification
    let landmarkIndexKey = "landmarkIndex"
    
    // TODO: why do we do this.  tut on hosting controllers in general
    override var body: NotificationsView {
        //we are overriding the 'body' method
        NotificationsView(title: title, message: message, landmark: landmark)
        // this instantiates the notification view
    }
    
    override func didReceive(_ notification: UNNotification) {
        // This method will parse the notification and update the controllers properties
        let modelData = ModelData()
        
        let notificationData = notification.request.content.userInfo as? [String: Any]
        
        let aps = notificationData?["aps"] as? [String: Any]
        let alert = aps?["alert"] as? [String: Any]
        
        //TODO: What's up with all the casting
        
        title = alert?["title"] as? String
        message = alert?["body"] as? String


        if let index = notificationData?[landmarkIndexKey] as? Int {
            landmark = modelData.landmarks[index]
        }
    }
    
}

