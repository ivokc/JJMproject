/**
 * @Author: jjm
 * @Date:   2017-12-19T16:47:06+08:00
 * @Email:  jijm@bosc.cn
 * @Project: JJMproject
 * @Filename: NativeUtility.js
 * @Last modified by:   jjm
 * @Last modified time: 2018-01-24T10:30:56+08:00
 */
import { Platform } from 'react-native';
import { JumpToNativeModule, CameraModule, ImageCacheModule, NotificationModule, PollingModule, PickerModule } from '../../native-modules/NativeModules';

export default NativeUtility = {

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
      return ImageCacheModule.currentDiskCacheSize();
    },

    clearCache() {
      ImageCacheModule.clearCache();
    },

    // 轮询
    startPolling(pollingID, timeInterval) {
      if (Platform.OS === 'android') {

      } else {
          PollingModule.startPolling(pollingID, timeInterval);
      }
    },

    stopPolling(pollingID) {
      if (Platform.OS === 'android') {

      } else {
          PollingModule.stopPolling(pollingID);
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

    //picker选择器
    showPicker(title, datas, badgeNumber) {
      if (Platform.OS === 'android') {

      } else {
        PickerModule.initPicker(datas,title,badgeNumber);
      }
    },
    showDatePicker(title, badgeNumber) {
      if (Platform.OS === 'android') {

      } else {
        PickerModule.initDatePicker(title,badgeNumber);
      }
    }

}
