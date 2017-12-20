/**
 * @Author: jjm
 * @Date:   2017-12-19T17:47:45+08:00
 * @Email:  jijm@bosc.cn
 * @Project: JJMproject
 * @Filename: Just.js
 * @Last modified by:   jjm
 * @Last modified time: 2017-12-20T17:53:02+08:00
 */
import NativeManager from '../manager/functional/NativeManager';
import UIManager from '../manager/ui/UIManager';

global.Just = {
    ...NativeManager,
    ...UIManager
}
