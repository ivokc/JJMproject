//
//  UIButton+Extension.swift
//  MarioFramework
//
//  Created by MeePwn on 2017/12/11.
//  Copyright © 2017年 Facebook. All rights reserved.
//

import UIKit

extension UIButton {
  
  func setTitleColor(color: UIColor) {
    setTitleColor(color, for: .normal)
    setTitleColor(color, for: .highlighted)
  }
  
  func setTitle(title: String) {
    setTitle(title, for: .normal)
    setTitle(title, for: .highlighted)
  }
  
  func setBackgroundColor(color: UIColor, forState: UIControlState) {
    
    UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
    UIGraphicsGetCurrentContext()!.setFillColor(color.cgColor)
    UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
    let colorImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    setBackgroundImage(colorImage, for: forState)
  }
  
}
