/**
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import "AppDelegate.h"
#import "JJMproject-Swift.h"

#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>

@interface AppDelegate() <BMKLocationAuthDelegate, BMKLocationManagerDelegate>

@property (nonatomic, strong) BMKLocationManager *locationManager;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  
  FileUtility *fileUtility = [FileUtility new];
  NSString *bundlePath = [[fileUtility documentPath] stringByAppendingPathComponent:@"main/bundle/index.bundle"];
  BOOL shouldLoadLocalBundle = [fileUtility fileExistsWithFilePath:bundlePath];
  
  NSURL *bundleURL = shouldLoadLocalBundle ? [NSURL URLWithString:bundlePath] : [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];
  
  [self loadJSBundleWithURL:bundleURL launchOptions:launchOptions];
  
  [self registerUtility];
  [self registerBDLocation];
  
  return YES;
}

- (void)loadJSBundleWithURL:(NSURL *)bundleURL launchOptions:(NSDictionary *)launchOptions
{
  RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:bundleURL
                                                      moduleName:@"JJMproject"
                                               initialProperties:nil
                                                   launchOptions:launchOptions];
  rootView.backgroundColor = UIColor.whiteColor;
  
  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  ModuleController *moduleController = [[ModuleController alloc] init];
  moduleController.view = rootView;
  self.window.rootViewController = moduleController;
  [self.window makeKeyAndVisible];
  
}

// MARK:- Private Method
- (void)registerUtility
{
  [NotificationUtility registerNotification];
}

- (void)registerBDLocation
{
  [[BMKLocationAuth sharedInstance] checkPermisionWithKey:@"MK2RPFbQ2P0Z3Gr4hysKRQPwxDymCqG1" authDelegate:self];
  
  _locationManager = [[BMKLocationManager alloc] init];
  
  _locationManager.delegate = self;
  
  _locationManager.coordinateType = BMKLocationCoordinateTypeBMK09LL;
  _locationManager.distanceFilter = kCLDistanceFilterNone;
  _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
  _locationManager.activityType = CLActivityTypeAutomotiveNavigation;
  _locationManager.pausesLocationUpdatesAutomatically = NO;
  _locationManager.allowsBackgroundLocationUpdates = YES;
  _locationManager.locationTimeout = 10;
  _locationManager.reGeocodeTimeout = 10;
}

// MARK:- Public Method
- (void)requestLocationWithBlock:(LocationCompletionBlock)completionBlock
{
  [_locationManager requestLocationWithReGeocode:YES withNetworkState:YES completionBlock:^(BMKLocation * _Nullable location, BMKLocationNetworkState state, NSError * _Nullable error) {
    completionBlock(location, state, error);
  }];
}

- (void)stopLocation
{
  [_locationManager stopUpdatingLocation];
}

// MARK:- BDMap delegate
- (void)onGetNetworkState:(int)iError
{
  if (0 == iError) {
    NSLog(@"联网成功");
  } else {
    NSLog(@"onGetNetworkState %d", iError);
  }
}

- (void)onGetPermissionState:(int)iError
{
  if (0 == iError) {
    NSLog(@"授权成功");
  } else {
    NSLog(@"onGetPermissionState %d", iError);
  }
}

- (void)onCheckPermissionState:(BMKLocationAuthErrorCode)iError
{
  NSLog(@"location auth onGetPermissionState %ld", (long)iError);
}

@end
