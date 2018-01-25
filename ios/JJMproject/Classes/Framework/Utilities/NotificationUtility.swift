//
//  NotificationUtility.swift
//  MarioFramework
//
//  Created by MeePwn on 2017/11/15.
//  Copyright © 2017年 Facebook. All rights reserved.
//

import UIKit

class NotificationUtility: NSObject {
  
  private lazy var localNotification: UILocalNotification = {
    let localNotification = UILocalNotification()
    localNotification.soundName = UILocalNotificationDefaultSoundName
    return localNotification
  }()
  
  class func registerNotification() {
    if let version = Double(UIDevice.current.systemVersion) {
      if version >= 8.0 {
        let setting = UIUserNotificationSettings(types: [.badge, .sound, .alert], categories: nil)
        UIApplication.shared.registerUserNotificationSettings(setting)
      }
    }
  }
  
  func sendLocalNotification(alertBody: String, alertAction: String, badgeNumber: Int) {
    localNotification.alertBody = alertBody
    localNotification.alertAction = alertAction
    localNotification.applicationIconBadgeNumber = badgeNumber
    UIApplication.shared.presentLocalNotificationNow(localNotification)
  }
  
  func sendLocalNotification(after: Double, alertBody: String, alertAction: String, badgeNumber: Int) {
    localNotification.alertBody = alertBody
    localNotification.alertAction = alertAction
    localNotification.applicationIconBadgeNumber = badgeNumber
    localNotification.fireDate = Date(timeIntervalSinceNow: after)
    UIApplication.shared.scheduleLocalNotification(localNotification)
  }
  
}
