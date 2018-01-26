/**
 * @Author: jjm
 * @Date:   2017-12-19T17:47:45+08:00
 * @Email:  jijm@bosc.cn
 * @Project: JJMproject
 * @Filename: Just.js
 * @Last modified by:   jjm
 * @Last modified time: 2018-01-26T10:48:34+08:00
 */
import {FunctionalManager,UIManager} from '../manager/manager';
// import * as manager from '../manager/manager'

global.Just = {
    ...FunctionalManager,
    ...UIManager
}
