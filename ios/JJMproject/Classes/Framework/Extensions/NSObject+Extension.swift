//
//  NSObject+Extension.swift
//  MarioFramework
//
//  Created by MeePwn on 2017/11/30.
//  Copyright © 2017年 Facebook. All rights reserved.
//

import UIKit

private let swizzling: (AnyClass, Selector, Selector) -> () = { forClass, originalSelector, swizzledSelector in
  let originalMethod = class_getInstanceMethod(forClass, originalSelector)
  let swizzledMethod = class_getInstanceMethod(forClass, swizzledSelector)
  method_exchangeImplementations(originalMethod!, swizzledMethod!)
}

extension NSObject {
  
  public class func swizzleClassMethodWithClass(cls: AnyClass, originalSelector: Selector, swizzledSelector: Selector) {
    let originalMethod = class_getClassMethod(cls, originalSelector)
    let swizzledMethod = class_getClassMethod(cls, swizzledSelector)

    let didAddMethod = class_addMethod(self, originalSelector, method_getImplementation(swizzledMethod!), method_getTypeEncoding(swizzledMethod!))

    if didAddMethod {
      class_replaceMethod(self, swizzledSelector, method_getImplementation(originalMethod!), method_getTypeEncoding(originalMethod!))
    } else {
      method_exchangeImplementations(originalMethod!, swizzledMethod!)
    }
  }
  
  public class func swizzleInstanceMethodWithClass(cls: AnyClass, originalSelector: Selector, swizzledSelector: Selector) {
    let originalMethod = class_getInstanceMethod(cls, originalSelector)
    let swizzledMethod = class_getInstanceMethod(cls, swizzledSelector)
    
    let didAddMethod = class_addMethod(cls, originalSelector, method_getImplementation(swizzledMethod!), method_getTypeEncoding(swizzledMethod!))
    
    if didAddMethod {
      class_replaceMethod(cls, swizzledSelector, method_getImplementation(originalMethod!), method_getTypeEncoding(originalMethod!))
    } else {
      method_exchangeImplementations(originalMethod!, swizzledMethod!)
    }
  }
  
}
