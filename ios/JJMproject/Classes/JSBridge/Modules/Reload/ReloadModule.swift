//
//  ReloadModule.swift
//  MarioFramework
//
//  Created by MeePwn on 2017/11/28.
//  Copyright © 2017年 Facebook. All rights reserved.
//

import UIKit
import Async

@objc(ReloadModule)
class ReloadModule: NSObject {

  @objc func reloadJSBundle(_ path: String) {
    Async.main {
      let delegate = UIApplication.shared.delegate as! AppDelegate
      if let rootView = RCTRootView(bundleURL: URL(fileURLWithPath: path), moduleName: "MarioFramework", initialProperties: nil, launchOptions: nil) {
        rootView.backgroundColor = UIColor.white
        
        if let window = delegate.window {
          if let rootViewController = window.rootViewController {
            rootViewController.view = rootView
          }
        }
      }
    }
  }
  
  @objc func reloadJSBundleFromDevServer() {
    Async.main {
      let delegate = UIApplication.shared.delegate as! AppDelegate
      if let rootView = RCTRootView(bundleURL: RCTBundleURLProvider.sharedSettings().jsBundleURL(forBundleRoot: "index", fallbackResource: nil), moduleName: "MarioFramework", initialProperties: nil, launchOptions: nil) {
        rootView.backgroundColor = UIColor.white
        
        if let window = delegate.window {
          if let rootViewController = window.rootViewController {
            rootViewController.view = rootView
          }
        }
      }
    }
  }
  
}
