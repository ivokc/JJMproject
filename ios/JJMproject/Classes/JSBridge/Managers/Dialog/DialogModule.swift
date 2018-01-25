//
//  DialogModule.swift
//  MarioFramework
//
//  Created by MeePwn on 2017/12/12.
//  Copyright © 2017年 Facebook. All rights reserved.
//

import UIKit
import Async

@objc(DialogModule)
class DialogModule: NSObject {
  
  private lazy var dialogManager: DialogManager = {
    return DialogManager()
  }()
  
  @objc func showSuccessWithAction(_ message: String, cancelable: Bool, positiveTitle: String, negativeTitle: String, positiveAction: @escaping RCTResponseSenderBlock) {
    Async.main {
//      let dialogManager = DialogManager()
      self.dialogManager.showSuccess(message: message, positiveTitle: positiveTitle) {
        self.dialogManager.dismiss()
        positiveAction(nil)
      }
    }
  }
  
  @objc func showSuccessWithActions(_ message: String, cancelable: Bool, positiveTitle: String, negativeTitle: String, positiveAction: @escaping RCTResponseSenderBlock, negativeAction: @escaping RCTResponseErrorBlock) {
    Async.main {
//      let dialogManager = DialogManager()
      self.dialogManager.showSuccess(message: message, positiveTitle: positiveTitle, negativeTitle: negativeTitle, positiveHandler: {
        self.dialogManager.dismiss()
        positiveAction(nil)
      }) {
        self.dialogManager.dismiss()
        negativeAction(nil)
      }
    }
  }
  
  @objc func showFailureWithAction(_ message: String, cancelable: Bool, positiveTitle: String, negativeTitle: String, positiveAction: @escaping RCTResponseSenderBlock) {
    Async.main {
//      let dialogManager = DialogManager()
      self.dialogManager.showFailure(message: message, positiveTitle: positiveTitle) {
        self.dialogManager.dismiss()
        positiveAction(nil)
      }
    }
  }
  
  @objc func showFailureWithActions(_ message: String, cancelable: Bool, positiveTitle: String, negativeTitle: String, positiveAction: @escaping RCTResponseSenderBlock, negativeAction: @escaping RCTResponseErrorBlock) {
    Async.main {
//      let dialogManager = DialogManager()
      self.dialogManager.showFailure(message: message, positiveTitle: positiveTitle, negativeTitle: negativeTitle, positiveHandler: {
        self.dialogManager.dismiss()
        positiveAction(nil)
      }) {
        self.dialogManager.dismiss()
        negativeAction(nil)
      }
    }
  }
  
  @objc func showMessageWithAction(_ message: String, cancelable: Bool, positiveTitle: String, negativeTitle: String, positiveAction: @escaping RCTResponseSenderBlock) {
    Async.main {
//      let dialogManager = DialogManager()
      self.dialogManager.showWarning(message: message, positiveTitle: positiveTitle) {
        self.dialogManager.dismiss()
        positiveAction(nil)
      }
    }
  }
  
  @objc func showMessageWithActions(_ message: String, cancelable: Bool, positiveTitle: String, negativeTitle: String, positiveAction: @escaping RCTResponseSenderBlock, negativeAction: @escaping RCTResponseErrorBlock) {
    Async.main {
//      let dialogManager = DialogManager()
      self.dialogManager.showWarning(message: message, positiveTitle: positiveTitle, negativeTitle: negativeTitle, positiveHandler: {
        self.dialogManager.dismiss()
        positiveAction(nil)
      }) {
        self.dialogManager.dismiss()
        negativeAction(nil)
      }
    }
  }
  
  @objc func dismiss() {
    Async.main {
      self.dialogManager.dismiss()
    }
  }

}
