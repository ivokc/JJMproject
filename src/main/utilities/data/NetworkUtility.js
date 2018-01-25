/**
 * @Author: jjm
 * @Date:   2018-01-15T18:45:40+08:00
 * @Email:  jijm@bosc.cn
 * @Project: JJMproject
 * @Filename: NetworkUtility.js
 * @Last modified by:   jjm
 * @Last modified time: 2018-01-23T16:35:01+08:00
 */
import { Platform } from 'react-native';
import { NetworkModule } from '../../native-modules/NativeModules';

const NetworkUtility = {

  sendRequest(url, params = {}) {
    if (Platform.OS === 'android') {
        return NetworkModule.sendRequest(url, params);

    } else {
        return NetworkModule.sendRequest(url, params, headers);
    }
  }

};

export default NetworkUtility;
