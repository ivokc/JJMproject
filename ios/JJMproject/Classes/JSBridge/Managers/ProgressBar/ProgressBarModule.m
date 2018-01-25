//
//  NetworkModule.m
//  MarioFramework
//
//  Created by MeePwn on 2017/11/14.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(ProgressBarModule, NSObject)

RCT_EXTERN_METHOD(show)
RCT_EXTERN_METHOD(showWithMessage:(NSString *)message)
RCT_EXTERN_METHOD(dismiss)

@end
