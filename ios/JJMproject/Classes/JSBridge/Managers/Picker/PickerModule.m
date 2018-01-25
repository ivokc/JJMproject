//
//  PickerModule.m
//  MarioFramework
//
//  Created by 罗晓锋 on 2017/12/27.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import "PickerModule.h"

#import <React/RCTEventEmitter.h>
#import <React/RCTEventDispatcher.h>
#import <React/RCTConvert.h>
#import <React/RCTBridge.h>

#import "RNPickView.h"
#import "RNDatePickView.h"

@interface PickerModule ()

@property (nonatomic, strong) RNPickView * pickView;
@property (nonatomic, strong) RNDatePickView * datePickView;

@end

@implementation PickerModule

//协议模块    注册实现了RCTBridgeModule协议
@synthesize bridge=_bridge;

- (RNPickView*)pickView{
  if (!_pickView) {
    _pickView = [[RNPickView alloc]init];
  }
  return _pickView;
}
- (RNDatePickView*)datePickView{
  if (!_datePickView) {
    _datePickView = [[RNDatePickView alloc]init];
  }
  return _datePickView;
}

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(initPicker:(NSArray *)contentArray withTitle:(NSString*)title positiveAction:(RCTResponseSenderBlock)positiveAction) {
  dispatch_async(dispatch_get_main_queue(), ^{
    self.pickView.contentArray = contentArray;
    self.pickView.title = title;
    [self.pickView show];
    self.pickView.pickerBlock = ^(NSString * message,NSInteger index){
      positiveAction(@[message, @(index)]);
    };
  });
}

RCT_EXPORT_METHOD(initDatePicker:(NSString *)title positiveAction:(RCTResponseSenderBlock)positiveAction) {
  dispatch_async(dispatch_get_main_queue(), ^{
    self.datePickView.title = title;
    [self.datePickView show];
    self.datePickView.pickerBlock = ^(NSString * message){
      positiveAction(@[message]);
    };
  });
}

RCT_EXPORT_METHOD(dismissPicker) {
  dispatch_async(dispatch_get_main_queue(), ^{
    [self.pickView dismiss];
  });
}
RCT_EXPORT_METHOD(dismissDatePicker) {
  dispatch_async(dispatch_get_main_queue(), ^{
    [self.datePickView dismiss];
  });
}



@end
