/**
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import <UIKit/UIKit.h>
#import <BMKLocationkit/BMKLocationComponent.h>
#import <BMKLocationkit/BMKLocationAuth.h>

typedef void (^LocationCompletionBlock)(BMKLocation * _Nullable location, BMKLocationNetworkState state, NSError * _Nullable error);

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow * _Nullable window;

- (void)requestLocationWithBlock:(LocationCompletionBlock _Nullable)completionBlock;
- (void)stopLocation;

@end
