/**
 * @Author: jjm
 * @Date:   2017-12-20T16:56:38+08:00
 * @Email:  jijm@bosc.cn
 * @Project: JJMproject
 * @Filename: StatusBarUtility.js
 * @Last modified by:   jjm
 * @Last modified time: 2017-12-20T17:41:27+08:00
 */

import { Platform } from 'react-native';
import {StatusBarModule} from '../../native-modules/NativeModules';

 export default StatusBarUtility = {

     hideStatusBar() {
         if (Platform.OS === 'android') {
             StatusBarModule.hideStatusBar();
         }
     },

     showStatusBar() {
         if (Platform.OS === 'android') {
             StatusBarModule.showStatusBar();
         }
     },

     setHexColor(hexColor: string) {
         if (Platform.OS === 'android') {
             StatusBarModule.setHexColor(hexColor);
         }
     }

 };
