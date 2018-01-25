//
//  FileUtility.swift
//  MarioFramework
//
//  Created by MeePwn on 2017/11/23.
//  Copyright © 2017年 Facebook. All rights reserved.
//

import UIKit
import Async

class FileUtility: NSObject {
  
  private lazy var fileManager: FileManager = {
    return FileManager.default
  }()

  func documentPath() -> String {
    let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
    return paths.last!
  }
  
  func cachePath() -> String {
    let paths = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)
    return paths.last!
  }
  
  func createDir(dirPath: String) {
    if !fileManager.fileExists(atPath: dirPath) {
      do {
        try fileManager.createDirectory(atPath: dirPath, withIntermediateDirectories: true, attributes: nil)
      } catch _ {}
    }
  }
  
  func createDirAtDocument(dirPath: String) {
    createDir(dirPath: "\(documentPath())/\(dirPath)")
  }
  
  func createDirAtCache(dirPath: String) {
    createDir(dirPath: "\(cachePath())/\(dirPath)")
  }
  
  func saveContent(content: String, filePath: String) {
    do {
      try content.write(toFile: filePath, atomically: true, encoding: .utf8)
    } catch _ {}
  }

  func readContent(filePath: String) -> String {
    var content = ""
    do {
      content = try String(contentsOfFile: filePath, encoding: .utf8)
    } catch _ {}
    return content
  }
  
  func copyFile(sourcePath: String, targetPath: String) {
    do {
      if fileExists(filePath: targetPath) {
        deleteFile(filePath: targetPath)
      }
      try self.fileManager.copyItem(atPath: sourcePath, toPath: targetPath)
    } catch _ {}
  }
  
  func copyFileAsync(sourcePath: String, targetPath: String) {
    Async.background {
      do {
        if self.fileExists(filePath: targetPath) {
          self.deleteFile(filePath: targetPath)
        }
        try self.fileManager.copyItem(atPath: sourcePath, toPath: targetPath)
      } catch _ {}
    }
  }
  
  func fileExists(filePath: String) -> Bool {
    return fileManager.fileExists(atPath: filePath)
  }

  func deleteFile(filePath: String) {
    do {
      try fileManager.removeItem(atPath: filePath)
    } catch _ {}
  }
  
  func isDirectory(filePath: String) -> Bool {
    var isDirectory = ObjCBool(false)
    fileManager.fileExists(atPath: filePath, isDirectory: &isDirectory)
    return isDirectory.boolValue
  }
  
  func allFiles(filePath: String, nextAction: (_: Any) -> Void) {
    if let enums = fileManager.enumerator(atPath: filePath) {
      while let file = enums.nextObject() {
        nextAction(file)
      }
    }
  }
  
  func allFiles(filePath: String) -> [Any] {
    var files = [Any]()
    if let enums = fileManager.enumerator(atPath: filePath) {
      while let file = enums.nextObject() {
        files.append(file)
      }
    }
    return files
  }
  
}
