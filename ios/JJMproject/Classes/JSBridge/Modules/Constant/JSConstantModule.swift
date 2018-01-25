//
//  JSConstant.swift
//  MarioFramework
//
//  Created by MeePwn on 2017/12/1.
//  Copyright © 2017年 Facebook. All rights reserved.
//

import UIKit

@objc(JSConstantModule)
class JSConstantModule: NSObject {

  @objc func initialize(_ constant: [String: Any]) {
    Constant.jsConstant = Constant(constant: constant)
  }
  
}
