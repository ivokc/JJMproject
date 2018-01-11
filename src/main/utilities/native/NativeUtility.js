/**
 * @Author: jjm
 * @Date:   2017-12-19T16:47:06+08:00
 * @Email:  jijm@bosc.cn
 * @Project: JJMproject
 * @Filename: NativeUtility.js
 * @Last modified by:   jjm
 * @Last modified time: 2017-12-28T14:06:20+08:00
 */
import {JumpToNativeModule} from '../../native-modules/NativeModules';

 export default NativeUtility = {

     openCamera(params) {
        return new Promise((resolve, reject) => {
            JumpToNativeModule.openCamera(params ? params : '{}', (response) => {
                resolve(response);
            }, (error) => {
                reject(error);
            });
        });
    }

 }
