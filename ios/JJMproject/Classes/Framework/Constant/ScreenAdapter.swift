//
//  ScreenAdapter.swift
//  MarioFramework
//
//  Created by MeePwn on 2017/12/13.
//  Copyright © 2017年 Facebook. All rights reserved.
//

import UIKit
import Device

let screenAdapter = ScreenAdapter()

struct ScreenAdapter {
  
  var screenWidth: CGFloat {
    get {
      return UIScreen.main.bounds.size.width
    }
  }
  
  var screenHeight: CGFloat {
    get {
      return UIScreen.main.bounds.size.height
    }
  }
  
  var p_5: Int {
    get {
      return 5
    }
  }
  
  var p_10: Int {
    get {
      return 10
    }
  }
  
  var p_15: Int {
    get {
      return 15
    }
  }
  
  var p_20: Int {
    get {
      return 20
    }
  }
  
  var p_30: Int {
    get {
      return 30
    }
  }
  
  var p_50: Int {
    get {
      return 50
    }
  }
  
  var p_60: Int {
    get {
      return 60
    }
  }
  
  var p_70: Int {
    get {
      return 70
    }
  }
  
  var p_80: Int {
    get {
      return 80
    }
  }
  
  var p_100: Int {
    get {
      return 100
    }
  }
  
  var cornerRadius: Int {
    get {
      return 10
    }
  }
  
  var smallFontSize: Int {
    get {
      return 18
    }
  }
  
  var fontSize: Int {
    get {
      return 20
    }
  }

  var largeFontSize: Int {
    get {
      return 24
    }
  }

  var margin: Int {
    get {
      return 10
    }
  }
  
  var middleMargin: Int {
    get {
      return 20
    }
  }
  
  var largeMargin: Int {
    get {
      return 30
    }
  }
  
  var padding: Int {
    get {
      return 10
    }
  }
  
  var buttonHeight: Int {
    get {
      return 44
    }
  }
  
  var buttonWidth: Int {
    get {
      return 80
    }
  }
  
  var dialogWidth: Int {
    get {
      return Int(screenWidth - 30)
    }
  }
  
  var dialogHeight: Int {
    get {
      return Int(screenHeight / 3)
    }
  }
  
  var dialogCenterYOffset: Int {
    get {
      return 80
    }
  }
  
  var dialogTitleHeight: Int {
    get {
      return 44
    }
  }
  
  var dialogImageWidth: Int {
    get {
      return 80
    }
  }
  
  var dialogImageMarginLeft: Int {
    get {
      return 50
    }
  }
  
  var dialogScrollableContentLayoutWidth: Int {
    get {
      return dialogWidth - dialogImageMarginLeft - dialogImageWidth - middleMargin - middleMargin
    }
  }
  
  var dialogButtonWidth: Int {
    get {
      return 120
    }
  }

}
