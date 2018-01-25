//
//  ZipUtility.swift
//  MarioFramework
//
//  Created by MeePwn on 2017/11/28.
//  Copyright © 2017年 Facebook. All rights reserved.
//

import UIKit
//import Zip
import Async

typealias NextAction = () -> Void
typealias ErrorHandler = (_: Error) -> Void

class ZipUtility: NSObject {
  
  private lazy var fileManager: FileManager = {
    return FileManager.default
  }()
  
  func unzip(sourcePath: String, targetPath: String, afterZip: @escaping NextAction = {}, errorHandler: @escaping ErrorHandler = { _ in }, deleteZip: Bool = false) {
    Async.background { 
//      do {
//        // Unzip
//        try Zip.unzipFile(URL(fileURLWithPath: sourcePath), destination: URL(fileURLWithPath: targetPath), overwrite: true, password: nil)
//        afterZip()
//        if deleteZip {
//          try self.fileManager.removeItem(atPath: sourcePath)
//        }
//      } catch let error {
//        errorHandler(error)
//      }
    }
  }

}
