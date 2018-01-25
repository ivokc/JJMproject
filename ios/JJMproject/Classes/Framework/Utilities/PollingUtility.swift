//
//  PollingUtility.swift
//  MarioFramework
//
//  Created by MeePwn on 2017/11/15.
//  Copyright © 2017年 Facebook. All rights reserved.
//

import UIKit
import RxSwift

class PollingUtility: NSObject {
  
  private lazy var pollingTimers: [String: Timer] = {
    return [String: Timer]()
  }()

  func startPolling(pollingID: String, timeInterval: Double, callback: @escaping (Any) -> ()) {
    if #available(iOS 10.0, *) {
      let timer = Timer(timeInterval: timeInterval, repeats: true, block: callback)
      RunLoop.main.add(timer, forMode: .defaultRunLoopMode)
      pollingTimers[pollingID] = timer
    } else {
      
    }
  }
  
  func stopPolling(pollingID: String) {
    if let timer = pollingTimers[pollingID] {
      timer.invalidate()
    }
  }
  
}
