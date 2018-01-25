//
//  ImageCacheModule.swift
//  MarioFramework
//
//  Created by MeePwn on 2017/11/14.
//  Copyright © 2017年 Facebook. All rights reserved.
//

import UIKit

@objc(ImageCacheModule)
class ImageCacheModule: NSObject {

  private lazy var imageCache: ImageCacheUtility = {
    return ImageCacheUtility()
  }()
  
  private lazy var dataUtility: DataUtility = {
    return DataUtility()
  }()
  
  @objc func cacheImage(_ key: String) {
    imageCache.cacheImage(key: key)
  }
  
  @objc func imageFromCache(_ key: String, resolve: RCTPromiseResolveBlock, reject: RCTPromiseRejectBlock) {
    if let image = imageCache.imageFromCache(key: key) {
      if let imageString = dataUtility.imageToBase64String(image: image) {
        resolve(imageString)
      } else {
        reject(ErrorCode.IMAGE_CACHE_TRANSFORM_TO_BASE64.rawValue, "图片转换失败", nil)
      }
    } else {
      reject(ErrorCode.IMAGE_CACHE_NO_SUCH_IMAGE.rawValue, "图片缓存不存在或获取失败", nil)
    }
  }
  
  @objc func currentDiskCacheSize(_ resolve: @escaping RCTPromiseResolveBlock, reject: RCTPromiseRejectBlock) {
    imageCache.currentDiskCacheSize { result in
      resolve(result)
    }
  }
  
  @objc func maxDiskCacheSize(_ resolve: RCTPromiseResolveBlock, reject: RCTPromiseRejectBlock) {
    resolve(imageCache.maxDiskCacheSize())
  }
  
  @objc func clearCache() {
    imageCache.clearCache()
  }
  
}
