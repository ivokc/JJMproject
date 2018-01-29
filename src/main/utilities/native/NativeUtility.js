/**
 * @Author: jjm
 * @Date:   2017-12-19T16:47:06+08:00
 * @Email:  jijm@bosc.cn
 * @Project: JJMproject
 * @Filename: NativeUtility.js
 * @Last modified by:   jjm
 * @Last modified time: 2018-01-29T17:20:22+08:00
 */
import { Platform } from 'react-native';
import { JumpToNativeModule, CameraModule, ImageCacheModule, NotificationModule, PollingModule, PickerModule,ExitAppModule } from '../../native-modules/NativeModules';

export default NativeUtility = {

    //拍照
    openCamera(params) {
      if (Platform.OS === 'android') {
         return JumpToNativeModule.openCamera(params.quality ? params.quality : 0.1);
      } else {
         return CameraModule.open(params);
      }
    },

    // 图片缓存
    cacheImage(imageURL) {

      ImageCacheModule.cacheImage(imageURL);
    },

    imageFromCache(imageURL) {
      return ImageCacheModule.imageFromCache(imageURL);
    },

    currentDiskCacheSize() {
        if (Platform.OS === 'android') {

        }else {
            return ImageCacheModule.currentDiskCacheSize();
        }
    },

    clearCache() {
      ImageCacheModule.clearCache();
    },

    // 轮询
    startPolling(pollingIdOrServiceName, timeInterval) {
      if (Platform.OS === 'android') {
          PollingModule.startPolling(pollingIdOrServiceName,timeInterval);
      } else {
          PollingModule.startPolling(pollingIdOrServiceName, timeInterval);
      }
    },

    stopPolling(pollingIdOrServiceName) {
      if (Platform.OS === 'android') {
          PollingModule.stopPolling(pollingIdOrServiceName);
      } else {
          PollingModule.stopPolling(pollingIdOrServiceName);
      }
    },

    // 通知
    sendLocalNotification(title, message, badgeNumber,activityName = 'this') {
      if (Platform.OS === 'android') {
          NotificationModule.showNotification(title,message,activityName);
      } else {
          NotificationModule.sendLocalNotification(title, message, badgeNumber);
      }
    },

    sendLocalNotificationAfter(after, title, message, badgeNumber) {
      if (Platform.OS === 'android') {

      } else {
        NotificationModule.sendLocalNotificationAfter(after, title, message, badgeNumber);
      }
    },

    //上行盒子统一认证
    getSSOToken(){
        if (Platform.OS === 'android') {
            return MdmAuthModule.getSSOToken();
        } else {
        }
    },
    getUserName(){
        if (Platform.OS === 'android') {
            return MdmAuthModule.getUserName();
        } else {
        }
    },




    //退出应用
    exitApp(){
        if (Platform.OS === 'android') {
            ExitAppModule.exitApp();
        }
    }


}
