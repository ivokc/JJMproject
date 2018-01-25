//
//  NetworkUtility.swift
//  MarioFramework
//
//  Created by MeePwn on 2017/11/13.
//  Copyright © 2017年 Facebook. All rights reserved.
//

import UIKit
import Alamofire
import RxSwift

class NetworkUtility: NSObject {
  
  func sendRequest(url: String, parameters: Parameters = [String: Any](), headers: Alamofire.HTTPHeaders = ["Content-Type": "application/json"]) -> Observable<Any> {
    print("== url ===>>>> \(url)")
    print("== parameters ===>>>> \(parameters)")
    return Observable.create { (observer) -> Disposable in
      Alamofire.request(url, method: parameters.isEmpty ? .get : .post, parameters: parameters, headers: headers).responseJSON { dataResponse in
        if let response = dataResponse.result.value {
          print("== response ===>>>> \(response)")
          observer.onNext(response)
          observer.onCompleted()
        } else if let error = dataResponse.error {
          print("== error ===>>>> \(error)")
          observer.onError(error)
        }
      }
      return Disposables.create()
      }
      .observeOn(MainScheduler.instance)
      .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
  }
  
  func download(url: String, targetFilePath: String) -> Observable<Any> {
    print("== url ===>>>> \(url)")
    print("== fileName ===>>>> \(targetFilePath)")
    let fileURL = URL(fileURLWithPath: targetFilePath)
    let destination: DownloadRequest.DownloadFileDestination = { _, _ in
      return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
    }
    return Observable.create({ observer -> Disposable in
      Alamofire.download(url, to: destination)
        .responseData { response in
          if let error = response.error {
            observer.onError(error)
          } else if let value = response.result.value {
            do {
              let error = try JSONSerialization.jsonObject(with: value, options: .mutableLeaves)
              print("== error ===>>>> \(error)")
              observer.onError(NSError(domain: "", code: -1, userInfo: nil))
            } catch _ {
              print("== fileURL ===>>>> \(fileURL)")
              observer.onNext(fileURL)
              observer.onCompleted()
            }
          }
      }
      return Disposables.create()
    })
      .observeOn(MainScheduler.instance)
      .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
  }
  
  func downloadWithProgress(closure: @escaping Alamofire.Request.ProgressHandler, url: String, targetFilePath: String) -> Observable<Any> {
    print("== url ===>>>> \(url)")
    print("== fileName ===>>>> \(targetFilePath)")
    let fileURL = URL(fileURLWithPath: targetFilePath)
    let destination: DownloadRequest.DownloadFileDestination = { _, _ in
      return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
    }
    return Observable.create({ observer -> Disposable in
      Alamofire.download(url, to: destination)
        .downloadProgress(closure: closure)
        .responseData { response in
          if let error = response.error {
            observer.onError(error)
          } else if let value = response.result.value {
            do {
              let error = try JSONSerialization.jsonObject(with: value, options: .mutableLeaves)
              print("== error ===>>>> \(error)")
              observer.onError(NSError(domain: "", code: -1, userInfo: nil))
            } catch _ {
              print("== fileURL ===>>>> \(fileURL)")
              observer.onNext(fileURL)
              observer.onCompleted()
            }
          }
      }
      return Disposables.create()
    })
      .observeOn(MainScheduler.instance)
      .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
  }
  
  func upload() {
    
  }
  
}


