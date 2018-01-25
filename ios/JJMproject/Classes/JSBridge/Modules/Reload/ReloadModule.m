//
//  NetworkModule.m
//  MarioFramework
//
//  Created by MeePwn on 2017/11/15.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(ReloadModule, NSObject)

RCT_EXTERN_METHOD(reloadJSBundle:(NSString *)path)
RCT_EXTERN_METHOD(reloadJSBundleFromDevServer)

@end
