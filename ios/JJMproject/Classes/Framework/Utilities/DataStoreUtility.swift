//
//  DataStoreUtility.swift
//  MarioFramework
//
//  Created by MeePwn on 2017/11/14.
//  Copyright © 2017年 Facebook. All rights reserved.
//

import UIKit
//import Haneke

enum StoreType: String {
  
  case STRING_STORE = "string"
  case IMAGE_STORE = "image"
  case DATA_STORE = "data"
  case JSON_STORE = "json"
  
}

class DataStoreUtility: NSObject {
  
//  private lazy var stringStore: Cache<String> = {
//    return Shared.stringCache
//  }()
//
//  private lazy var imageStore: Cache<UIImage> = {
//    return Shared.imageCache
//  }()
//
//  private lazy var dataStore: Cache<Data> = {
//    return Shared.dataCache
//  }()
//
//  private lazy var JSONStore: Cache<JSON> = {
//    return Shared.JSONCache
//  }()

  func set(value: Any, key: String) {
//    if value is String {
//      stringStore.set(value: value as! String, key: key)
//    } else if value is UIImage {
//      imageStore.set(value: value as! UIImage, key: key)
//    } else if value is Data {
//      dataStore.set(value: value as! Data, key: key)
//    } else if value is JSON {
//      JSONStore.set(value: value as! JSON, key: key)
//    }
  }
  
  func value(key: String, storeType: StoreType, success: @escaping (Any) -> (), failure: @escaping (Error?) -> ()) {
//    if storeType == StoreType.STRING_STORE {
//      stringStore.fetch(key: key).onSuccess(success).onFailure(failure)
//    } else if storeType == StoreType.IMAGE_STORE {
//      imageStore.fetch(key: key).onSuccess(success).onFailure(failure)
//    } else if storeType == StoreType.DATA_STORE {
//      dataStore.fetch(key: key).onSuccess(success).onFailure(failure)
//    } else if storeType == StoreType.JSON_STORE {
//      JSONStore.fetch(key: key).onSuccess(success).onFailure(failure)
//    }
  }
  
  func clearAll() {
//    stringStore.removeAll()
//    imageStore.removeAll()
//    dataStore.removeAll()
//    JSONStore.removeAll()
  }
  
}
