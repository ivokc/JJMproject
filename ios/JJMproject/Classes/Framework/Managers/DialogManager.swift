//
//  InfoDialog.swift
//  MarioFramework
//
//  Created by MeePwn on 2017/12/11.
//  Copyright © 2017年 Facebook. All rights reserved.
//

import UIKit

class DialogManager: NSObject {
  
  class func manager() -> DialogManager {
    return DialogManager()
  }
  
  private lazy var dialog: Dialog = {
    return Dialog()
  }()
  
  func showSuccess(message: String, positiveTitle: String = "确定", positiveHandler: @escaping PositiveHandler) {
    dialog.show(title: "成功", imageName: "dialog_success_icon", message: message, positiveTitle: positiveTitle, positiveHandler: positiveHandler)
  }
  
  func showSuccess(message: String, positiveTitle: String = "确定", negativeTitle: String = "取消", positiveHandler: @escaping PositiveHandler, negativeHandler: @escaping NegativeHandler) {
    dialog.show(title: "成功", imageName: "dialog_success_icon", message: message, positiveTitle: positiveTitle, negativeTitle: negativeTitle, positiveHandler: positiveHandler, negativeHandler: negativeHandler)
  }
  
  func showFailure(message: String, positiveTitle: String = "确定", positiveHandler: @escaping PositiveHandler) {
    dialog.show(title: "失败", imageName: "dialog_failure_icon", message: message, positiveTitle: positiveTitle, positiveHandler: positiveHandler)
  }
  
  func showFailure(message: String, positiveTitle: String = "确定", negativeTitle: String = "取消", positiveHandler: @escaping PositiveHandler, negativeHandler: @escaping NegativeHandler) {
    dialog.show(title: "失败", imageName: "dialog_failure_icon", message: message, positiveTitle: positiveTitle, negativeTitle: negativeTitle, positiveHandler: positiveHandler, negativeHandler: negativeHandler)
  }
  
  func showWarning(message: String, positiveTitle: String = "确定", positiveHandler: @escaping PositiveHandler) {
    dialog.show(title: "提示", imageName: "dialog_message_icon", message: message, positiveTitle: positiveTitle, positiveHandler: positiveHandler)
  }
  
  func showWarning(message: String, positiveTitle: String = "确定", negativeTitle: String = "取消", positiveHandler: @escaping PositiveHandler, negativeHandler: @escaping NegativeHandler) {
    dialog.show(title: "提示", imageName: "dialog_message_icon", message: message, positiveTitle: positiveTitle, negativeTitle: negativeTitle, positiveHandler: positiveHandler, negativeHandler: negativeHandler)
  }
  
  func dismiss() {
    dialog.dismisss()
  }
  
  deinit {
    print("====== deinit DialogManager ======")
  }
  
}
