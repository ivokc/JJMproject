//
//  NetworkModule.m
//  MarioFramework
//
//  Created by MeePwn on 2017/11/14.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(DialogModule, NSObject)

RCT_EXTERN_METHOD(showSuccessWithAction:(NSString *)message cancelable:(BOOL)cancelable positiveTitle:(NSString *)positiveTitle negativeTitle:(NSString *)negativeTitle positiveAction:(RCTResponseSenderBlock)positiveAction)
RCT_EXTERN_METHOD(showSuccessWithActions:(NSString *)message cancelable:(BOOL)cancelable positiveTitle:(NSString *)positiveTitle negativeTitle:(NSString *)negativeTitle positiveAction:(RCTResponseSenderBlock)positiveAction negativeAction:(RCTResponseErrorBlock)negativeAction)

RCT_EXTERN_METHOD(showFailureWithAction:(NSString *)message cancelable:(BOOL)cancelable positiveTitle:(NSString *)positiveTitle negativeTitle:(NSString *)negativeTitle positiveAction:(RCTResponseSenderBlock)positiveAction)
RCT_EXTERN_METHOD(showFailureWithActions:(NSString *)message cancelable:(BOOL)cancelable positiveTitle:(NSString *)positiveTitle negativeTitle:(NSString *)negativeTitle positiveAction:(RCTResponseSenderBlock)positiveAction negativeAction:(RCTResponseErrorBlock)negativeAction)

RCT_EXTERN_METHOD(showMessageWithAction:(NSString *)message cancelable:(BOOL)cancelable positiveTitle:(NSString *)positiveTitle negativeTitle:(NSString *)negativeTitle positiveAction:(RCTResponseSenderBlock)positiveAction)
RCT_EXTERN_METHOD(showMessageWithActions:(NSString *)message cancelable:(BOOL)cancelable positiveTitle:(NSString *)positiveTitle negativeTitle:(NSString *)negativeTitle positiveAction:(RCTResponseSenderBlock)positiveAction negativeAction:(RCTResponseErrorBlock)negativeAction)
RCT_EXTERN_METHOD(dismiss)

@end
