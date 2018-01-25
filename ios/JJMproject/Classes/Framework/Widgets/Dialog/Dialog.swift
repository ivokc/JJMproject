//
//  Dialog.swift
//  MarioFramework
//
//  Created by MeePwn on 2017/12/11.
//  Copyright © 2017年 Facebook. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

typealias PositiveHandler = () -> ()
typealias NegativeHandler = () -> ()

struct DialogOptions {
  var title: String
  var message: String
  var positiveTitle: String
  var negativeTitle: String
  
  init(title: String = "", message: String = "", positiveTitle: String = "确定", negativeTitle: String = "取消") {
    self.title = title
    self.message = message
    self.positiveTitle = positiveTitle
    self.negativeTitle = negativeTitle
  }
  
}

class Dialog: UIView {
  
  let duration = 0.2
  
  private lazy var backgroundView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
    return view
  }()
  
  private lazy var dialogLayout: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.white
    view.layer.cornerRadius = 10
    view.clipsToBounds = true
    return view
  }()
  
  private lazy var titleLayout: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor(hex: 0xEDEDED)
    return view
  }()
  
  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .left
    return label
  }()
  
  private lazy var contentLayout: UIView = {
    let view = UIView()
    return view
  }()
  
  private lazy var contentImage: UIImageView = {
    let imageView = UIImageView()
    return imageView
  }()
  
  private lazy var contentScrollableLayout: UIScrollView = {
    let scrollLayout = UIScrollView()
    return scrollLayout
  }()
  
  private lazy var contentLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    label.font = label.font.withSize(20)
    label.sizeToFit()
    return label
  }()
  
  private lazy var buttonLayout: UIView = {
    let view = UIView()
    return view
  }()
  
  private lazy var positiveButton: UIButton = {
    let button = UIButton(type: .custom)
    button.layer.cornerRadius = 10
    button.clipsToBounds = true
    button.setTitleColor(color: UIColor.white)
    button.setBackgroundColor(color: UIColor.lightBlue(), forState: .normal)
    button.setBackgroundColor(color: UIColor.darkBlue(), forState: .highlighted)
    button.setBackgroundColor(color: UIColor.lightLightBlue(), forState: .disabled)
    return button
  }()
  
  private var positiveDisposable: Disposable?
  private var negativeDisposable: Disposable?
  
  private lazy var negativeButton: UIButton = {
    let button = UIButton(type: .custom)
    button.layer.cornerRadius = 10
    button.clipsToBounds = true
    button.setTitleColor(color: UIColor.white)
    button.setBackgroundColor(color: UIColor.lightGray(), forState: .normal)
    button.setBackgroundColor(color: UIColor.darkGray(), forState: .highlighted)
    button.setBackgroundColor(color: UIColor.lightLightGray(), forState: .disabled)
    return button
  }()
  
  convenience init() {
    self.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    
    let options = DialogOptions()
    titleLabel.text = options.title
    contentLabel.text = options.message
    positiveButton.setTitle(title: options.positiveTitle)
    negativeButton.setTitle(title: options.negativeTitle)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setup() {
    frame = CGRect(x: 0, y: 0, width: screenAdapter.screenWidth, height: screenAdapter.screenHeight)
    
    initViews()
    setupViews()
  }
  
  private func initViews() {
    addSubview(backgroundView)
    addSubview(dialogLayout)
    
    dialogLayout.addSubview(titleLayout)
    titleLayout.addSubview(titleLabel)
    
    dialogLayout.addSubview(contentLayout)
    contentLayout.addSubview(contentImage)
    contentLayout.addSubview(contentScrollableLayout)
    contentScrollableLayout.addSubview(contentLabel)
    
    dialogLayout.addSubview(buttonLayout)
    buttonLayout.addSubview(positiveButton)
    buttonLayout.addSubview(negativeButton)
  }
  
  private func setupViews() {
    backgroundView.snp.makeConstraints { make in
      make.center.width.height.equalToSuperview()
    }
    dialogLayout.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.centerY.equalToSuperview().offset(-screenAdapter.dialogCenterYOffset)
      make.width.equalTo(screenAdapter.dialogWidth)
      make.height.equalTo(screenAdapter.dialogHeight)
    }
    
    titleLayout.snp.makeConstraints { make in
      make.left.top.right.equalToSuperview()
      make.height.equalTo(screenAdapter.dialogTitleHeight)
    }
    titleLabel.snp.makeConstraints { make in
      make.centerY.equalToSuperview()
      make.left.equalToSuperview().offset(screenAdapter.margin)
      make.height.equalToSuperview()
    }
    
    contentLayout.snp.makeConstraints { make in
      make.top.equalTo(self.titleLayout.snp.bottom)
      make.left.right.equalToSuperview()
      make.bottom.equalTo(self.buttonLayout.snp.top).offset(-screenAdapter.margin)
    }
    contentImage.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(screenAdapter.largeMargin)
      make.left.equalToSuperview().offset(screenAdapter.dialogImageMarginLeft)
      make.width.height.equalTo(screenAdapter.dialogImageWidth)
    }
    contentScrollableLayout.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(screenAdapter.largeMargin)
      make.left.equalTo(self.contentImage.snp.right).offset(screenAdapter.middleMargin)
      make.bottom.equalToSuperview().offset(-screenAdapter.margin)
      make.width.equalToSuperview().offset(-screenAdapter.dialogScrollableContentLayoutWidth)
    }
    contentLabel.snp.makeConstraints { make in
      make.top.left.bottom.equalToSuperview()
      make.right.equalTo(self.titleLayout).offset(-screenAdapter.middleMargin)
    }
    
    buttonLayout.snp.makeConstraints { make in
      make.bottom.equalToSuperview().offset(-screenAdapter.margin)
      make.centerX.equalToSuperview()
      make.height.equalTo(screenAdapter.buttonHeight)
    }
    negativeButton.snp.makeConstraints { make in
      make.left.height.centerY.equalToSuperview()
      make.right.equalTo(self.positiveButton.snp.left).offset(-screenAdapter.margin)
      make.width.equalTo(screenAdapter.dialogButtonWidth)
    }
    positiveButton.snp.makeConstraints { make in
      make.right.height.centerY.equalToSuperview()
      make.left.equalTo(self.negativeButton.snp.right).offset(screenAdapter.margin)
      make.width.equalTo(screenAdapter.dialogButtonWidth)
    }
    
  }
  
  private func fadeIn() {
    alpha = 0
    UIView.animate(withDuration: duration, animations: {
      self.alpha = 1.0
    })
  }
  
  private func attach() {
    if let window = UIApplication.shared.keyWindow {
      if let context = window.rootViewController {
        context.view.addSubview(self)
      }
    }
  }
  
  func show(title: String, imageName: String, message: String, positiveTitle: String, positiveHandler: @escaping PositiveHandler) {
    fadeIn()
    
    titleLabel.text = title
    contentLabel.text = message
    contentImage.image = UIImage(named: imageName)
    positiveButton.setTitle(title: positiveTitle)
    positiveDisposable = positiveButton.rx.controlEvent(.touchUpInside)
      .asObservable()
      .subscribe(onNext: { _ in
        positiveHandler()
      })
    
    negativeButton.isHidden = true
    positiveButton.snp.remakeConstraints { make in
      make.center.height.equalToSuperview()
      make.width.equalTo(screenAdapter.dialogButtonWidth)
    }
    
    attach()
  }
  
  func show(title: String, imageName: String, message: String, positiveTitle: String, negativeTitle: String, positiveHandler: @escaping PositiveHandler, negativeHandler: @escaping NegativeHandler) {
    fadeIn()
    
    titleLabel.text = title
    contentLabel.text = message
    contentImage.image = UIImage(named: imageName)
    positiveButton.setTitle(title: positiveTitle)
    negativeButton.setTitle(title: negativeTitle)
    positiveDisposable = positiveButton.rx.controlEvent(.touchUpInside)
      .asObservable()
      .subscribe(onNext: { _ in
        positiveHandler()
      })
    negativeDisposable = negativeButton.rx.controlEvent(.touchUpInside)
      .asObservable()
      .subscribe(onNext: { _ in
        negativeHandler()
      })
    
    negativeButton.isHidden = false
    negativeButton.snp.remakeConstraints { make in
      make.left.height.centerY.equalToSuperview()
      make.right.equalTo(self.positiveButton.snp.left).offset(-screenAdapter.margin)
      make.width.equalTo(screenAdapter.dialogButtonWidth)
    }
    positiveButton.snp.remakeConstraints { make in
      make.right.height.centerY.equalToSuperview()
      make.left.equalTo(self.negativeButton.snp.right).offset(screenAdapter.margin)
      make.width.equalTo(screenAdapter.dialogButtonWidth)
    }
    
    attach()
  }
  
  func dismisss() {
    alpha = 1.0
    UIView.animate(withDuration: duration, animations: {
      self.alpha = 0
    }) { _ in
      if let disposable = self.positiveDisposable {
        disposable.dispose()
      }
      if let disposable = self.negativeDisposable {
        disposable.dispose()
      }
      
      self.contentLabel.text = ""
      self.removeFromSuperview()
    }
  }
  
  deinit {
    print("====== deinit Dialog ======")
  }
  
}
