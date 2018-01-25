//
//  CameraModule.swift
//  MarioFramework
//
//  Created by MeePwn on 2018/1/2.
//  Copyright © 2018年 Facebook. All rights reserved.
//

import UIKit
import Async

@objc(CameraModule)
class CameraModule: NSObject {
  
  private lazy var cameraUtility: CameraUtility = {
    return CameraUtility()
  }()
  
  @objc func open(_ config: [String: Float], resolve: @escaping RCTPromiseResolveBlock, reject: @escaping RCTPromiseRejectBlock) {
    Async.main {
      if let window = UIApplication.shared.keyWindow {
        if let context = window.rootViewController {
          self.cameraUtility.openCamera(config: config, context: context, confirmHandler: { info in
            resolve(info)
          }) {
            reject(ErrorCode.CAMERA_FAILURE.rawValue, "== 拍照出错啦 ==", NSError(domain: "", code: -1, userInfo: nil))
          }
        }
      }
    }
  }
  
  @objc func close() {
    cameraUtility.close()
  }
  
}
