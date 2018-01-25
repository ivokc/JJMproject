//
//  EventEmitter.swift
//  MarioFramework
//
//  Created by MeePwn on 2017/11/27.
//  Copyright © 2017年 Facebook. All rights reserved.
//

import UIKit

class EventEmitter {
  
  public static var sharedInstance = EventEmitter()
  private static var eventEmitter: ReactNativeEventEmitter!
  
  lazy var allEvents: [String] = {
    return [ "DownloadProgressEvent" ]
  }()
  
  private init() {}
  
  func registerEventEmitter(eventEmitter: ReactNativeEventEmitter) {
    EventEmitter.eventEmitter = eventEmitter
  }
  
  func dispatch(name: String, body: Any?) {
    EventEmitter.eventEmitter.sendEvent(withName: name, body: body)
  }

}
