//
//  NetworkModule.swift
//  MarioFramework
//
//  Created by MeePwn on 2017/11/13.
//  Copyright © 2017年 Facebook. All rights reserved.
//

import UIKit
import Alamofire

@objc(NetworkModule)
class NetworkModule: NSObject {
  
  private lazy var eventEmitter: EventEmitter = {
    return EventEmitter.sharedInstance
  }()
  
  private lazy var networkUtility: NetworkUtility = {
    return NetworkUtility()
  }()
  
  @objc func sendRequest(_ url: String, parameters: Alamofire.Parameters = [String: Any](), headers: Alamofire.HTTPHeaders = ["Content-Type": "application/json"], resolve: @escaping RCTPromiseResolveBlock, reject: @escaping RCTPromiseRejectBlock) {
    _ = networkUtility
      .sendRequest(url: url, parameters: parameters, headers: headers)
      .subscribe(onNext: { response in
        resolve(response)
      }, onError: { error in
        reject(ErrorCode.NETWORK_FAILURE.rawValue, "网络请求失败或超时", error)
      })
  }
  
  @objc func download(_ url: String, fileName: String, resolve: @escaping RCTPromiseResolveBlock, reject: @escaping RCTPromiseRejectBlock) {
    _ = networkUtility
      .download(url: url, targetFilePath: fileName)
      .subscribe(onNext: { fileUrl in
        resolve((fileUrl as! URL).absoluteString)
      }, onError: { error in
        reject(ErrorCode.NETWORK_DOWNLOAD_FAILURE.rawValue, "文件下载失败", error)
      })
  }

  @objc func downloadWithProgress(_ url: String, fileName: String, resolve: @escaping RCTPromiseResolveBlock, reject: @escaping RCTPromiseRejectBlock) {
    _ = networkUtility
      .downloadWithProgress(closure: { progress in
        self.eventEmitter.dispatch(name: "DownloadProgressEvent", body: [
          "progress": "\(progress.fractionCompleted)"
        ])
      }, url: url, targetFilePath: fileName)
      .subscribe(onNext: { fileUrl in
        resolve((fileUrl as! URL).absoluteString)
      }, onError: { error in
        reject(ErrorCode.NETWORK_DOWNLOAD_FAILURE.rawValue, "文件下载失败", error)
      })
  }
  
}
