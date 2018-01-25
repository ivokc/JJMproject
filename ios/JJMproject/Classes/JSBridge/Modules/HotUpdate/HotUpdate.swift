//
//  HotUpdate.swift
//  MarioFramework
//
//  Created by MeePwn on 2017/11/28.
//  Copyright © 2017年 Facebook. All rights reserved.
//

import UIKit

typealias HotUpdateSuccess = (_: Any) -> Void
typealias HotUpdateFailure = (_: [String: Any]) -> Void

class HotUpdate: NSObject {
  
  private lazy var fileUtility: FileUtility = {
    return FileUtility()
  }()
  private lazy var zip: ZipUtility = {
    return ZipUtility()
  }()
  private lazy var network: NetworkUtility = {
    return NetworkUtility()
  }()
  private lazy var dmp: DiffMatchPatch = {
    return DiffMatchPatch()
  }()
  
  func update(config: HotUpdateConfig, success: @escaping HotUpdateSuccess = { _ in }, failure: @escaping HotUpdateFailure = { _ in }) {
    print("== config ===>>>> \(config)")
    // 1.判断并生成bundle目录
    genPackageFolder(config: config)
    // 2.下载更新包
    _ = network.download(url: config.jsBundleRemoteURL, targetFilePath: config.jsPatchZipPath)
      .subscribe(onNext: { fileURL in
        self.handleZIP(config: config, success: success, failure: failure)
      }, onError: { error in
        failure([ "errorCode": ErrorCode.NETWORK_DOWNLOAD_FAILURE.rawValue, "errorMessage": "文件下载失败", "error": error ])
      })
  }
  
  func isJSBundleExist(filePath: String) -> Bool {
    return fileUtility.fileExists(filePath: filePath)
  }
  
  /**
   * 生成文件夹
   */
  private func genPackageFolder(config: HotUpdateConfig) {
    fileUtility.createDir(dirPath: config.moduleFolder)
  }
  
  /**
   * 解压
   */
  private func handleZIP(config: HotUpdateConfig, success: @escaping HotUpdateSuccess, failure: @escaping HotUpdateFailure) {
    // 判断本地 JSBundle 是否存在
    let jsBundleExist = isJSBundleExist(filePath: config.jsBundlePath)
    let targetPath = jsBundleExist ? config.futureModuleFolder : config.moduleFolder
    // 开启单独线程，解压，合并。
    zip.unzip(sourcePath: config.jsPatchZipPath, targetPath: targetPath, afterZip: {
      // 判断下载的是全量包还是增量包
      guard jsBundleExist else {
        // 下载解压全量包后, 直接返回
        success(config.jsBundlePath)
        return
      }
      // 增量包合并
      self.mergePatches(config: config, success: success, failure: failure)
    }, errorHandler: { error in
      failure([ "errorCode": ErrorCode.HOT_UPDATE_UNZIP_FAILURE.rawValue, "errorMessage": "文件解压失败", "error": error ])
    }, deleteZip: true)
  }
  
  /**
   * 与 future 资源目录下的 bundle.pat 进行合并
   */
  private func mergePatches(config: HotUpdateConfig, success: @escaping HotUpdateSuccess, failure: @escaping HotUpdateFailure) {
    // 1.解析 future 卡目录下的 bundle
    let bundleStr = fileUtility.readContent(filePath: config.jsBundlePath)
    // 2.解析最新下发的 .pat 文件字符串
    let pattchStr = fileUtility.readContent(filePath: config.futurePatchPath)
    // 3.合并
    merge(patchStr: pattchStr, bundle: bundleStr, config: config, success: success, failure: failure)
    // 4.添加图片
    copyPatchImages(config: config)
    copyVendorPatchImages(config: config)
    // 5.删除本次下发的更新文件
    fileUtility.deleteFile(filePath: config.futureModuleFolder)
  }
  
  /*
   * 合并
   */
  private func merge(patchStr: String, bundle: String, config: HotUpdateConfig, success: @escaping HotUpdateSuccess, failure: @escaping HotUpdateFailure) {
    guard patchStr.count != 0 || !isJSBundleExist(filePath: config.jsBundlePath) else {
      failure([ "errorCode": ErrorCode.HOT_UPDATE_PATCH_FILE_IS_EMPTY_OR_INDEX_BUNDLE_IS_NOT_EXIST_FAILURE.rawValue, "errorMessage": "补丁文件为空或 index.bundle 不存在", "error": NSError(domain: "", code: -1, userInfo: nil) ])
      return
    }
    
    do {
      let patches = try dmp.patch_(fromText: patchStr)
      if let bundleArray = dmp.patch_apply(patches as! [Any], to: bundle) {
        let newBundleString = bundleArray[0] as! String
        fileUtility.saveContent(content: newBundleString, filePath: config.jsBundlePath)
        success(config.jsBundlePath)
      }
    } catch let error {
      failure([ "errorCode": ErrorCode.HOT_UPDATE_PATCH_APPLY_FAILURE.rawValue, "errorMessage": "补丁合并失败", "error": error ])
    }
  }
  
  /*
   * 拷贝图片
   */
  private func copyPatchImages(config: HotUpdateConfig) {
    // 图片文件夹不存在, 直接返回
    guard fileUtility.fileExists(filePath: config.futureResourceImagesFolder) else {
      return
    }
    
    fileUtility.allFiles(filePath: config.futureResourceImagesFolder) { file in
      let targetPath = "\(config.resourceImagesFolder)\(file)"
      let sourcePath = "\(config.futureResourceImagesFolder)\(file)"
      
      fileUtility.copyFile(sourcePath: sourcePath, targetPath: targetPath)
    }
    
  }
  
  /*
   * 拷贝第三方库图片
   */
  private func copyVendorPatchImages(config: HotUpdateConfig) {
    // 图片文件夹不存在, 直接返回
    guard fileUtility.fileExists(filePath: config.futureVendorImagesFolder) else {
      return
    }
    
    fileUtility.allFiles(filePath: config.futureVendorImagesFolder) { file in
      let sourcePath = "\(config.futureVendorImagesFolder)\(file)"
      let targetPath = "\(config.vendorImagesFolder)\(file)"
      guard fileUtility.isDirectory(filePath: sourcePath) else {
        fileUtility.copyFile(sourcePath: sourcePath, targetPath: targetPath)
        return
      }
      fileUtility.createDir(dirPath: targetPath)
    }
    
  }

}
