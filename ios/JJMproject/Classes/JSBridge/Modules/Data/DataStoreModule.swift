//
//  DataStoreModule.swift
//  MarioFramework
//
//  Created by MeePwn on 2017/11/14.
//  Copyright © 2017年 Facebook. All rights reserved.
//

import UIKit

@objc(DataStoreModule)
class DataStoreModule: NSObject {
  
  private lazy var dataUtility: DataUtility = {
    return DataUtility()
  }()
  
  private lazy var dataStore: DataStoreUtility = {
    return DataStoreUtility()
  }()

  @objc func set(_ value: Any, key: String) {
//    dataStore.set(value: value, key: key)
  }
  
  @objc func value(_ key: String, storeType: String, resolve: @escaping RCTPromiseResolveBlock, reject: @escaping RCTPromiseRejectBlock) {
//    if storeType == StoreType.STRING_STORE.rawValue {
//      dataStore.value(key: key, storeType: StoreType.STRING_STORE, success: { string in
//        resolve(string)
//      }, failure: { error in
//        reject(ErrorCode.DATA_STORE_FAILURE.rawValue, "== key: \(key) 获取失败 ==", error)
//      })
//    } else if storeType == StoreType.IMAGE_STORE.rawValue {
//      dataStore.value(key: key, storeType: StoreType.IMAGE_STORE, success: { image in
//        if let imageString = self.dataUtility.imageToBase64String(image: image as! UIImage) {
//          resolve(imageString)
//        } else {
//          reject(ErrorCode.IMAGE_CACHE_TRANSFORM_TO_BASE64.rawValue, "== key: \(key) 图片转换失败 ==", nil)
//        }
//      }, failure: { error in
//        reject(ErrorCode.DATA_STORE_FAILURE.rawValue, "== key: \(key) 获取失败 ==", error)
//      })
//    } else if storeType == StoreType.DATA_STORE.rawValue {
//      dataStore.value(key: key, storeType: StoreType.DATA_STORE, success: { data in
//        resolve(self.dataUtility.dataToBase64String(data: data as! Data))
//      }, failure: { error in
//        reject(ErrorCode.DATA_STORE_FAILURE.rawValue, "== key: \(key) 获取失败 ==", error)
//      })
//    } else if storeType == StoreType.JSON_STORE.rawValue {
//      dataStore.value(key: key, storeType: StoreType.JSON_STORE, success: { json in
//        resolve(json)
//      }, failure: { error in
//        reject(ErrorCode.DATA_STORE_FAILURE.rawValue, "== key: \(key) 获取失败 ==", error)
//      })
//    } else {
//      reject(ErrorCode.DATA_STORE_FAILURE.rawValue, "== key: \(key) storeType 不存在 ==", NSError(domain: "", code: -1, userInfo: nil))
//    }
  }
  
  @objc func clearAll() {
//    dataStore.clearAll()
  }
  
}
