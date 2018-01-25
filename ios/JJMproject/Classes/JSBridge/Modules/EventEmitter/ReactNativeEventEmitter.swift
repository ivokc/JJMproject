//
//  ReactNativeEventEmitter.swift
//  MarioFramework
//
//  Created by MeePwn on 2017/11/27.
//  Copyright © 2017年 Facebook. All rights reserved.
//

import Foundation

@objc(ReactNativeEventEmitter)
open class ReactNativeEventEmitter: RCTEventEmitter {
  
  override init() {
    super.init()
    EventEmitter.sharedInstance.registerEventEmitter(eventEmitter: self)
  }
  
  @objc open override func supportedEvents() -> [String] {
    return EventEmitter.sharedInstance.allEvents
  }
  
}
