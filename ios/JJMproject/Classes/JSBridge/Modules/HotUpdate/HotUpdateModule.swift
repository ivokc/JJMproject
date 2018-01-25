//
//  HotUpdateModule.swift
//  MarioFramework
//
//  Created by MeePwn on 2017/11/28.
//  Copyright © 2017年 Facebook. All rights reserved.
//

import UIKit

@objc(HotUpdateModule)
class HotUpdateModule: NSObject {
  
//  private lazy var hotUpdate: HotUpdate = {
//    return HotUpdate()
//  }()
  private var hotUpdate = HotUpdate()
  private lazy var fileUtility: FileUtility = {
    return FileUtility()
  }()
  
  @objc func update(_ config: [String: String], resolve: @escaping RCTPromiseResolveBlock, reject: @escaping RCTPromiseRejectBlock) {
    let baseFolderPath = config["targetPathType"] == "cache" ? fileUtility.cachePath() : fileUtility.documentPath()
    let hotUpdateConfig = HotUpdateConfig
      .Builder()
      .setFirstUpdateKey(firstUpdateKey: config["firstUpdateKey"]!)
      .setModuleFolder(moduleFolder: "\(baseFolderPath)\(config["moduleFolder"]!)")
      .setJSBundleRemoteURL(jsBundleRemoteURL: config["jsBundleRemoteURL"]!)
      .build()
    hotUpdate.update(config: hotUpdateConfig, success: { result in
      resolve(result)
    }) { errorMap in
      reject(errorMap["errorCode"] as? String, errorMap["errorMessage"] as? String, errorMap["error"] as? Error)
    }
  }
  
  @objc func isJSBundleExist(_ config: [String: String], resolve: @escaping RCTPromiseResolveBlock, reject: @escaping RCTPromiseRejectBlock) {
    let baseFolderPath = config["targetPathType"] == "cache" ? fileUtility.cachePath() : fileUtility.documentPath()
    let isExist = hotUpdate.isJSBundleExist(filePath: "\(baseFolderPath)\(config["moduleFolder"]!)/bundle/index.bundle".replacingOccurrences(of: "//", with: "/"))
    resolve(isExist)
  }

}
