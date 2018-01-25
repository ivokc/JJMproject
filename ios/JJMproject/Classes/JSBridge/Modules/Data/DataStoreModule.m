//
//  NetworkModule.m
//  MarioFramework
//
//  Created by MeePwn on 2017/11/13.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(DataStoreModule, NSObject)

RCT_EXTERN_METHOD(set:(id)value key:(NSString *)key)
RCT_EXTERN_METHOD(value:(NSString *)key storeType:(NSString *)storeType resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject)
RCT_EXTERN_METHOD(clearAll)

@end
