//
//  LocationModule.swift
//  MarioFramework
//
//  Created by MeePwn on 2017/11/20.
//  Copyright © 2017年 Facebook. All rights reserved.
//

import UIKit
import Async

@objc(LocationModule)
class LocationModule: NSObject {
  
  private lazy var locationUtility: LocationUtility = {
    return LocationUtility()
  }()
  
  @objc func requestLocationInfo(_ resolve: @escaping RCTPromiseResolveBlock, reject: @escaping RCTPromiseRejectBlock) {
    Async.main {
      self.locationUtility.requestLocationInfo(block: { (locationInfo, error) in
        if error != nil {
          reject(ErrorCode.LOCATION_FAILURE.rawValue, "定位失败", error)
        } else {
          resolve(locationInfo)
        }
      })
    }
  }
  
  @objc func stopLocation() {
    Async.main {
      self.locationUtility.stopLocation()
    }
  }

}
