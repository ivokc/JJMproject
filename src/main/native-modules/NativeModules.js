/**
 * @Author: jjm <ivokc>
 * @Date:   2017-12-14T15:48:04+08:00
 * @Email:  jijm@bosc.cn
 * @Project: JJMproject
 * @Filename: NativeModules.js
 * @Last modified by:   jjm
 * @Last modified time: 2018-01-26T16:07:26+08:00
 */
import { NativeModules } from 'react-native';

//ui
export const StatusBarModule =  NativeModules.StatusBarModule;
export const SplashScreenModule =  NativeModules.SplashScreenModule;
export const DialogModule =  NativeModules.DialogModule;
export const PickerViewModule =  NativeModules.PickerViewModule;//android
export const PickerModule =  NativeModules.PickerModule;//ios

//functional
export const JumpToNativeModule = NativeModules.JumpToNativeModule;
export const ExistAppModule = NativeModules.ExistAppModule;
export const ImageCacheModule = NativeModules.ImageCacheModule;
export const LogModule = NativeModules.LogModule;
export const NetworkModule = NativeModules.NetworkModule;

export const JSConstantModule = NativeModules.JSConstantModule;
export const LocationModule = NativeModules.LocationModule;
export const NotificationModule = NativeModules.NotificationModule;
export const PollingModule = NativeModules.PollingModule;
export const ProgressBarModule = NativeModules.ProgressBarModule;
export const SandboxModule = NativeModules.SandboxModule;
export const CameraModule = NativeModules.CameraModule;
