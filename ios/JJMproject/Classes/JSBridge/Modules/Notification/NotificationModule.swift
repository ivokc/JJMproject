//
//  NotificationModule.swift
//  MarioFramework
//
//  Created by MeePwn on 2017/11/15.
//  Copyright © 2017年 Facebook. All rights reserved.
//

import UIKit
import Async

@objc(NotificationModule)
class NotificationModule: NSObject {

  private lazy var notificationUtility: NotificationUtility = {
    return NotificationUtility()
  }()
  
  @objc func sendLocalNotification(_ alertBody: String, alertAction: String, badgeNumber: Int) {
    Async.main {
      self.notificationUtility.sendLocalNotification(alertBody: alertBody, alertAction: alertAction, badgeNumber: badgeNumber)
    }
  }
  
  @objc func sendLocalNotification(_ after: Double, alertBody: String, alertAction: String, badgeNumber: Int) {
    Async.main {
      self.notificationUtility.sendLocalNotification(after: after, alertBody: alertBody, alertAction: alertAction, badgeNumber: badgeNumber)
    }
  }
  
}
