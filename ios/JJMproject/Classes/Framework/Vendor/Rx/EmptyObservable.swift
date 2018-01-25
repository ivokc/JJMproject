//
//  EmptyObservable.swift
//  MarioFramework
//
//  Created by MeePwn on 2017/11/15.
//  Copyright © 2017年 Facebook. All rights reserved.
//

import UIKit
import RxSwift

class EmptyObservable: NSObject {

  class func observable() -> Observable<String> {
    return Observable<String>.create { (observer) -> Disposable in
      observer.onNext("")
      observer.onCompleted()
      return Disposables.create()
    }
      .observeOn(MainScheduler.instance)
      .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
  }
  
}
