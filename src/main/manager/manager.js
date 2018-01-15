/**
 * @Author: jjm
 * @Date:   2017-12-25T14:42:02+08:00
 * @Email:  jijm@bosc.cn
 * @Project: JJMproject
 * @Filename: manager.js
 * @Last modified by:   jjm
 * @Last modified time: 2018-01-15T18:50:14+08:00
 */

 import NativeUtility from '../utilities/native/NativeUtility';
 import SplashScreenUtility from '../utilities/ui/SplashScreenUtility';
 import StatusBarUtility from '../utilities/ui/StatusBarUtility';
 import DialogUtility from '../utilities/ui/DialogUtility';
 import NetworkUtility from '../utilities/ui/NetworkUtility';


//functional
export const NativeManager = {
  ...NativeUtility,
  ...NetworkUtility
};


//ui
export const UIManager = {
   ...SplashScreenUtility,
   ...StatusBarUtility,
   ...DialogUtility
};
