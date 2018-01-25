//
//  Constant.swift
//  MarioFramework
//
//  Created by MeePwn on 2017/11/21.
//  Copyright © 2017年 Facebook. All rights reserved.
//

import UIKit

class Constant {
  
  static var jsConstant: Constant?
  
  let BASE_URL: String
  let DOWNLOAD_URL: String
  
  init(constant: [String: Any]) {
    
    BASE_URL = constant["BASE_URL"] as! String
    DOWNLOAD_URL = constant["DOWNLOAD_URL"] as! String
  }
  
}
