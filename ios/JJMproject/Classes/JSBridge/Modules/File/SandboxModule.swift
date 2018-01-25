//
//  FileModule.swift
//  MarioFramework
//
//  Created by MeePwn on 2017/11/29.
//  Copyright © 2017年 Facebook. All rights reserved.
//

import UIKit

@objc(SandboxModule)
class SandboxModule: NSObject {
  
  private lazy var fileUtility: FileUtility = {
    return FileUtility()
  }()
  
  @objc func documentPath(_ resolve: RCTPromiseResolveBlock, reject: RCTPromiseRejectBlock) {
    resolve(fileUtility.documentPath())
  }
  
  @objc func cachePath(_ resolve: RCTPromiseResolveBlock, reject: RCTPromiseRejectBlock) {
    resolve(fileUtility.cachePath())
  }
  
}
