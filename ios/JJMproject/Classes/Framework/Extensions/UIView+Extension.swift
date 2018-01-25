//
//  UIView+Extension.swift
//  MarioFramework
//
//  Created by MeePwn on 2017/11/30.
//  Copyright © 2017年 Facebook. All rights reserved.
//

import UIKit

extension UIView {
  
  var x: CGFloat {
    set {
      var frame = self.frame
      frame.origin.x = newValue
      self.frame = frame
    }
    get {
      return frame.origin.x
    }
  }
  
  var y: CGFloat {
    set {
      var frame = self.frame
      frame.origin.y = newValue
      self.frame = frame
    }
    get {
      return frame.origin.y
    }
  }
  
  var width: CGFloat {
    set {
      var frame = self.frame
      frame.size.width = newValue
      self.frame = frame
    }
    get {
      return frame.size.width
    }
  }
  
  var height: CGFloat {
    set {
      var frame = self.frame
      frame.size.height = newValue
      self.frame = frame
    }
    get {
      return frame.size.height
    }
  }
  
  var size: CGSize {
    set {
      var frame = self.frame
      frame.size = newValue
      self.frame = frame
    }
    get {
      return frame.size
    }
  }
  
  var origin: CGPoint {
    set {
      var frame = self.frame
      frame.origin = newValue
      self.frame = frame
    }
    get {
      return frame.origin
    }
  }
  
  var centerX: CGFloat {
    set {
      var center = self.center
      center.x = newValue
      self.center = center
    }
    get {
      return center.x
    }
  }
  
  var centerY: CGFloat {
    set {
      var center = self.center
      center.y = newValue
      self.center = center
    }
    get {
      return center.y
    }
  }
  
}
