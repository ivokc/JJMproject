/**
 * @Author: jjm <ivokc>
 * @Date:   2017-12-14T16:12:11+08:00
 * @Email:  jijm@bosc.cn
 * @Project: JJMproject
 * @Filename: InitializeConfig.js
 * @Last modified by:   jjm
 * @Last modified time: 2017-12-14T16:39:16+08:00
 */


 import StatusBarModule from '../native-modules/ui/StatusBarModule';

 const InitializeConfig = {

     setupAppConfiguration() {

         // 设置StatusBar颜色
         StatusBarModule.setHexColor(Color.lightBlue);

     }

 };

 export default InitializeConfig;
