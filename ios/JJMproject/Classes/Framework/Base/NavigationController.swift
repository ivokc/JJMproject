//
//  NavigationController.swift
//  MarioFramework
//
//  Created by MeePwn on 2017/11/30.
//  Copyright © 2017年 Facebook. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

  override func viewDidLoad() {
    super.viewDidLoad()

    
  }
  
  override var prefersStatusBarHidden: Bool {
    return (self.topViewController?.prefersStatusBarHidden)!
  }
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return (self.topViewController?.preferredStatusBarStyle)!
  }

}
