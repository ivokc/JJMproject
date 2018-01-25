//
//  PollingModule.swift
//  MarioFramework
//
//  Created by MeePwn on 2017/11/15.
//  Copyright © 2017年 Facebook. All rights reserved.
//

import UIKit

@objc(PollingModule)
class PollingModule: NSObject {

  private lazy var pollingUtility: PollingUtility = {
    return PollingUtility()
  }()
  
  @objc func startPolling(_ pollingID: String, timeInterval: Double) {
    pollingUtility.startPolling(pollingID: pollingID, timeInterval: timeInterval) { _ in
      // TODO 发送轮询成功信息
      print("== pollingID ===>>>> \(pollingID)")
    }
  }
  
  @objc func stopPolling(_ pollingID: String, resolve: RCTPromiseResolveBlock, reject: RCTPromiseRejectBlock) {
    pollingUtility.stopPolling(pollingID: pollingID)
    resolve(pollingID)
  }
  
}
