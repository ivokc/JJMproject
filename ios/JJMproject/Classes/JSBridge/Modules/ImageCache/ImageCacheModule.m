//
//  NetworkModule.m
//  MarioFramework
//
//  Created by MeePwn on 2017/11/13.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(ImageCacheModule, NSObject)

RCT_EXTERN_METHOD(cacheImage:(NSString *)key)
RCT_EXTERN_METHOD(imageFromCache:(NSString *)key resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject)
RCT_EXTERN_METHOD(currentDiskCacheSize:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject)
RCT_EXTERN_METHOD(maxDiskCacheSize:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject)
RCT_EXTERN_METHOD(clearCache)

@end

