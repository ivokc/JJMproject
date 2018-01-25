//
//  ProgressBarManager.swift
//  MarioFramework
//
//  Created by MeePwn on 2017/11/14.
//  Copyright © 2017年 Facebook. All rights reserved.
//

import UIKit

class ProgressBarManager: NSObject {
  
  class func manager() -> ProgressBarManager {
    return ProgressBarManager()
  }
  
  private lazy var progressBar: ProgressBar = {
    return ProgressBar()
  }()
  
  func show() {
    progressBar.show()
  }
  
  func show(message: String) {
    progressBar.show(message: message)
  }
  
  func dismiss() {
    progressBar.dismiss()
  }
  
  deinit {
    print("====== deinit ProgressBarManager ======")
  }

}
