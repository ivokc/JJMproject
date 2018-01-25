//
//  ProgressBar.swift
//  MarioFramework
//
//  Created by MeePwn on 2017/11/13.
//  Copyright © 2017年 Facebook. All rights reserved.
//

import UIKit
import SnapKit

class ProgressBar: UIView {
  
  let duration = 0.2
  
  private lazy var backgroundView: UIView = {
    let backgroundView = UIView()
    backgroundView.backgroundColor = UIColor.init(hex: 0x000000, alpha: 0.7)
    return backgroundView
  }()
  
  private lazy var progressPanel: UIView = {
    let progressPanel = UIView()
    progressPanel.backgroundColor = UIColor.black
    return progressPanel
  }()
  
  private lazy var progressLabel: UILabel = {
    let label = UILabel()
    label.textColor = UIColor.white
    label.textAlignment = NSTextAlignment.center
    return label
  }()
  
  private lazy var progressBar: MaterialLoadingProgressBar = {
    let progressBar = MaterialLoadingProgressBar()
    return progressBar
  }()
  
  init() {
    super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))

    progressPanel.addSubview(progressLabel)
    progressPanel.addSubview(progressBar)
    backgroundView.addSubview(progressPanel)
    addSubview(backgroundView)
    
    backgroundView.snp.makeConstraints { (make) in
      make.center.equalToSuperview()
      make.width.equalToSuperview()
      make.height.equalToSuperview()
    }
    progressPanel.snp.makeConstraints { (make) in
      make.center.equalToSuperview()
      make.width.equalTo(250)
      make.height.equalTo(150)
    }
    progressBar.snp.makeConstraints { (make) in
      make.center.equalToSuperview()
      make.width.height.equalTo(70)
    }
    progressLabel.snp.makeConstraints { (make) in
      make.top.equalTo(progressBar.snp.bottom).offset(10)
      make.left.equalToSuperview().offset(20)
      make.right.equalToSuperview().offset(-20)
      make.bottom.equalToSuperview().offset(-10)
    }
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func show() {
    alpha = 0
    UIView.animate(withDuration: duration, animations: {
      self.alpha = 1.0
    })
    progressBar.startAnimating()
    
    let label = progressPanel.subviews[0] as! UILabel
    if label.text == nil {
      progressPanel.snp.remakeConstraints({ (make) in
        make.center.equalToSuperview()
        make.width.equalTo(250)
        make.height.equalTo(150)
      })
    }
    
    if let window = UIApplication.shared.keyWindow {
      if let context = window.rootViewController {
        context.view.addSubview(self)
      }
    }
  }
  
  func show(message: String) {
    alpha = 0
    UIView.animate(withDuration: duration, animations: {
      self.alpha = 1.0
    })
    progressBar.startAnimating()
    
    let label = progressPanel.subviews[0] as! UILabel
    label.text = message
    if label.text != nil {
      progressPanel.snp.remakeConstraints({ (make) in
        make.center.equalToSuperview()
        make.width.equalTo(250)
        make.height.equalTo(170)
      })
    }
    
    if let window = UIApplication.shared.keyWindow {
      if let context = window.rootViewController {
        context.view.addSubview(self)
      }
    }
  }
  
  func dismiss() {
    alpha = 1.0
    UIView.animate(withDuration: duration, animations: {
      self.alpha = 0
    }) { _ in
      self.progressBar.stopAnimating()
      self.removeFromSuperview()
    }
  }

  deinit {
    print("====== deinit ProgressBar ======")
  }
  
}
