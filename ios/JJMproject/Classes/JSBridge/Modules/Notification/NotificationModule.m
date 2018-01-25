//
//  NetworkModule.m
//  MarioFramework
//
//  Created by MeePwn on 2017/11/15.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(NotificationModule, NSObject)

RCT_EXTERN_METHOD(sendLocalNotification:(double)after alertBody:(NSString *)alertBody alertAction:(NSString *)alertAction badgeNumber:(int)badgeNumber)
RCT_EXTERN_METHOD(sendLocalNotification:(NSString *)alertBody alertAction:(NSString *)alertAction badgeNumber:(int)badgeNumber)

@end


