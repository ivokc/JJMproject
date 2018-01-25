//
//  ImageCacheUtility.swift
//  MarioFramework
//
//  Created by MeePwn on 2017/11/14.
//  Copyright © 2017年 Facebook. All rights reserved.
//

import UIKit
import Kingfisher

class ImageCacheUtility: NSObject {
  
  func cacheImage(key: String) {
    let url = URL(string: key)
    let manager = KingfisherManager.shared
    let resource = ImageResource(downloadURL: url!, cacheKey: key)
    
    manager.retrieveImage(with: resource, options: nil, progressBlock: nil) { (image, error, cacheType, url) in
      if (error == nil) {
        
      } else {
        
      }
    }
  }
  
  func imageFromCache(key: String) -> Image? {
    let cache = KingfisherManager.shared.cache
    if let image = cache.retrieveImageInMemoryCache(forKey: key) {
      return image
    } else if let image = cache.retrieveImageInDiskCache(forKey: key) {
      return image
    }
    return nil
  }
  
  func imageCache() -> ImageCache {
    return KingfisherManager.shared.cache
  }
  
  func currentDiskCacheSize(completion: @escaping (UInt) -> ()) {
    let cache = KingfisherManager.shared.cache
    cache.calculateDiskCacheSize(completion: completion)
  }
  
  func maxDiskCacheSize() -> UInt {
    let cache = KingfisherManager.shared.cache
    return cache.maxDiskCacheSize
  }
  
  func clearCache() {
    let cache = KingfisherManager.shared.cache
    cache.clearDiskCache()
    cache.clearMemoryCache()
  }
  
}
