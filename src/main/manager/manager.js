/**
 * @Author: jjm
 * @Date:   2017-12-25T14:42:02+08:00
 * @Email:  jijm@bosc.cn
 * @Project: JJMproject
 * @Filename: manager.js
 * @Last modified by:   jjm
 * @Last modified time: 2018-01-26T16:13:53+08:00
 */

import NativeUtility from '../utilities/native/NativeUtility';
import SplashScreenUtility from '../utilities/ui/SplashScreenUtility';
import StatusBarUtility from '../utilities/ui/StatusBarUtility';
import DialogUtility from '../utilities/ui/DialogUtility';
import NetworkUtility from '../utilities/data/NetworkUtility';
import DBUtility from '../utilities/data/DBUtility';
import JSONUtility from '../utilities/data/JSONUtility';
import DebugUtility from '../utilities/other/DebugUtility';
import PickerViewUtility from '../utilities/ui/PickerViewUtility';

//functional
export const FunctionalManager = {
  ...NativeUtility,
  ...NetworkUtility,
  ...DBUtility,
  ...JSONUtility,
  ...DebugUtility
};


//ui
export const UIManager = {
   ...SplashScreenUtility,
   ...StatusBarUtility,
   ...DialogUtility,
   ...PickerViewUtility
};
