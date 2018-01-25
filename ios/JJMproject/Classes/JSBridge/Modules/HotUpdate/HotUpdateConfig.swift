//
//  HotUpdateConfig.swift
//  MarioFramework
//
//  Created by MeePwn on 2017/11/28.
//  Copyright © 2017年 Facebook. All rights reserved.
//

import UIKit
import HandyJSON

/*
 参数参考 eg:
 {
   "firstUpdateKey": "first update key",
   "zipName": "bundle",
   "jsBundleName": "index.bundle",
   "moduleFolder": "/$sandbox/$moduleName/",
   "jsBundleFolder": "/$sandbox/$moduleName/bundle/",
   "xhDrawableFolder": "/$sandbox/$moduleName/bundle/drawable-xhdpi/",
   "drawableFolder": "/$sandbox/$moduleName/bundle/drawable-mdpi/",
   "futureModuleFolder": "/$sandbox/$moduleName/future/",
   "futureXHDrawableFolder": "/$sandbox/$moduleName/future/bundle/drawable-xhdpi/",
   "futureDrawableFolder": "/$sandbox/$moduleName/future/bundle/drawable-mdpi/",
   "futurePatchPath": "/$sandbox/$moduleName/future/bundle/bundle.pat",
   "jsPatchZipPath": "/$sandbox/$moduleName/bundle.zip",
   "jsBundlePath": "/$sandbox/$moduleName/bundle/index.bundle",
   "patchPath": "/$sandbox/$moduleName/bundle/bundle.pat",
   "jsBundleRemoteURL": "http://localhost:9999/server/download?fileName=bundle.zip&platform=android"
 }
 
 */

class HotUpdateConfig: NSObject, HandyJSON {
  
  /**
   * 标识是否是第一次下载更新包
   */
  var firstUpdateKey = ""
  
  /**
   * zip的文件名
   */
  var zipName = ""
  
  /**
   * bundle文件名
   */
  var jsBundleName = ""
  
  /**
   * 第一次解压zip后的文件目录
   */
  var moduleFolder = ""
  
  var jsBundleFolder = ""
  var assetsFolder = ""
  var resourceImagesFolder = ""
  var vendorImagesFolder = ""
  
  /**
   * 除第一次外，未来解压zip后的文件目录
   */
  var futureModuleFolder = ""
  var futurePatchPath = ""
  var futureResourceImagesFolder = ""
  var futureVendorImagesFolder = ""
  
  var futureAssetsFolder = ""
  
  /**
   * zip文件
   */
  var jsPatchZipPath = ""
  
  /**
   * 合并后的bundle文件保存路径
   */
  var jsBundlePath = ""
  
  /**
   * .pat文件
   */
  var patchPath = ""
  
  /**
   * 下载URL
   */
  var jsBundleRemoteURL = ""
  
  internal required override init() {
    super.init()
  }
  
  init(builder: Builder) {
    super.init()
    
    self.firstUpdateKey = builder.firstUpdateKey
    self.zipName = builder.zipName
    self.jsBundleName = builder.jsBundleName
    self.moduleFolder = builder.moduleFolder
    
    if let lastChar = self.moduleFolder.last {
      if "\(lastChar)" != "/" {
        self.moduleFolder = "\(self.moduleFolder)/"
      }
    }
    
    self.jsBundleFolder = "\(self.moduleFolder)\(self.zipName)/"
    self.assetsFolder = "\(self.jsBundleFolder)assets/"
    self.resourceImagesFolder = "\(self.assetsFolder)resource/images/"
    self.vendorImagesFolder = "\(self.assetsFolder)node_modules/"
    self.patchPath = "\(self.moduleFolder)\(self.zipName)/bundle.pat"
    self.futureModuleFolder = "\(self.moduleFolder)future/"
    self.futureAssetsFolder = "\(self.futureModuleFolder)\(self.zipName)/assets/"
    self.futureResourceImagesFolder = "\(self.futureAssetsFolder)resource/images/"
    self.futureVendorImagesFolder = "\(self.futureAssetsFolder)node_modules/"
    self.futurePatchPath = "\(self.futureModuleFolder)\(self.zipName)/bundle.pat"
    self.jsPatchZipPath = "\(self.moduleFolder)\(self.zipName).zip"
    self.jsBundlePath = "\(self.moduleFolder)\(self.zipName)/\(self.jsBundleName)"
    self.jsBundleRemoteURL = builder.jsBundleRemoteURL
  }
  
  override var description: String {
    return self.toJSONString(prettyPrint: true)!
  }
  
  public class Builder {
    
    fileprivate var firstUpdateKey = ""
    fileprivate var zipName = "bundle"
    fileprivate var jsBundleName = "index.bundle"
    fileprivate var moduleFolder = ""
    fileprivate var jsBundleRemoteURL = ""
    
    func setFirstUpdateKey(firstUpdateKey: String) -> Self {
      self.firstUpdateKey = firstUpdateKey
      return self
    }
    
    func setZipName(zipName: String) -> Self {
      self.zipName = zipName
      return self
    }
    
    func setJSBundleName(jsBundleName: String) -> Self {
      self.jsBundleName = jsBundleName
      return self
    }
    
    func setModuleFolder(moduleFolder: String) -> Self {
      self.moduleFolder = moduleFolder
      return self
    }
    
    func setJSBundleRemoteURL(jsBundleRemoteURL: String) -> Self {
      self.jsBundleRemoteURL = jsBundleRemoteURL
      return self
    }
    
    func build() -> HotUpdateConfig {
      return HotUpdateConfig(builder: self)
    }
    
  }

}
