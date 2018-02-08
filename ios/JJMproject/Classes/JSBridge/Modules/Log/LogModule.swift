//
//  LogModule.swift
//  JJMproject
//
//  Created by MeePwn on 2018/1/22.
//  Copyright © 2018年 Facebook. All rights reserved.
//

import UIKit

@objc(LogModule)
class LogModule: NSObject {

  @objc func log(_ data: String) {
    print("\(data)")
  }
  
}
