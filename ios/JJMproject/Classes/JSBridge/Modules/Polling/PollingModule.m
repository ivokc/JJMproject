//
//  NetworkModule.m
//  MarioFramework
//
//  Created by MeePwn on 2017/11/15.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(PollingModule, NSObject)

RCT_EXTERN_METHOD(startPolling:(NSString *)pollingID timeInterval:(double)timeInterval)
RCT_EXTERN_METHOD(stopPolling:(NSString *)pollingID resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject)

@end
