//
//  NetworkModule.m
//  MarioFramework
//
//  Created by MeePwn on 2017/11/15.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(SandboxModule, NSObject)

RCT_EXTERN_METHOD(documentPath:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject)
RCT_EXTERN_METHOD(cachePath:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject)

@end
