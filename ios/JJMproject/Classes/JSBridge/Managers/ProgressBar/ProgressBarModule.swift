//
//  ProgressBarModule.swift
//  MarioFramework
//
//  Created by MeePwn on 2017/11/14.
//  Copyright © 2017年 Facebook. All rights reserved.
//

import UIKit
import Async

@objc(ProgressBarModule)
class ProgressBarModule: NSObject {
  
  private lazy var progressBarManager: ProgressBarManager = {
    return ProgressBarManager()
  }()
  
  @objc func show() {
    Async.main {
      self.progressBarManager.show()
    }
  }
  
  @objc func show(message: String) {
    Async.main {
      self.progressBarManager.show(message: message)
    }
  }
  
  @objc func dismiss() {
    Async.main {
      self.progressBarManager.dismiss()
    }
  }
  
}
