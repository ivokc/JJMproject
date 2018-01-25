//
//  UIColor+Extension.swift
//  MarioFramework
//
//  Created by MeePwn on 2017/11/13.
//  Copyright © 2017年 Facebook. All rights reserved.
//

import UIKit

extension UIColor {

  convenience init(hex: UInt) {
    self.init(hex: hex, alpha: 1.0)
  }
  
  convenience init(hex: UInt, alpha: CGFloat) {
    self.init(
      red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
      green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
      blue: CGFloat(hex & 0x0000FF) / 255.0,
      alpha: CGFloat(alpha)
    )
  }
  
  // MARK: Colors
  
  static func random() -> UIColor {
    return UIColor(red: CGFloat(arc4random_uniform(255)) / 255.0, green: CGFloat(arc4random_uniform(255)) / 255.0, blue: CGFloat(arc4random_uniform(255)) / 255.0, alpha: 1.0)
  }

  static func navy() -> UIColor {
    return UIColor(hex: 0x001f3f)
  }
  
  static func blue() -> UIColor {
    return UIColor(hex: 0x0074d9)
  }
  
  static func lightLightBlue() -> UIColor {
    return UIColor(hex: 0x1177DB)
  }
  
  static func lightBlue() -> UIColor {
    return UIColor(hex: 0x1177DB)
  }
  
  static func darkBlue() -> UIColor {
    return UIColor(hex: 0x0B4D8D)
  }
  
  static func lightLightGray() -> UIColor {
    return UIColor(hex: 0x7F7F7F)
  }
  
  static func lightGray() -> UIColor {
    return UIColor(hex: 0x7F7F7F)
  }
  
  static func darkGray() -> UIColor {
    return UIColor(hex: 0x666666)
  }
  
  static func aqua() -> UIColor {
    return UIColor(hex: 0x7fdbff)
  }
  
  static func teal() -> UIColor {
    return UIColor(hex: 0x39cccc)
  }
  
  static func olive() -> UIColor {
    return UIColor(hex: 0x3d9970)
  }
  
  static func green() -> UIColor {
    return UIColor(hex: 0x2ecc40)
  }

  static func lime() -> UIColor {
    return UIColor(hex: 0x01ff70)
  }
  
  static func yellow() -> UIColor {
    return UIColor(hex: 0xffdc00)
  }
  
  static func orange() -> UIColor {
    return UIColor(hex: 0xff851b)
  }
  
  static func red() -> UIColor {
    return UIColor(hex: 0xff4136)
  }
  
  static func maroon() -> UIColor {
    return UIColor(hex: 0x85144b)
  }
  
  static func fuchsia() -> UIColor {
    return UIColor(hex: 0xf012be)
  }
  
  static func purple() -> UIColor {
    return UIColor(hex: 0xb10dc9)
  }

  static func black() -> UIColor {
    return UIColor(hex: 0x111111)
  }
  
  static func gray() -> UIColor {
    return UIColor(hex: 0xaaaaaa)
  }
  
  static func silver() -> UIColor {
    return UIColor(hex: 0xdddddd)
  }

  static func white() -> UIColor {
    return UIColor(hex: 0xffffff)
  }
  
}
