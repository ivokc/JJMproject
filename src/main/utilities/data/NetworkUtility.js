/**
 * @Author: jjm
 * @Date:   2018-01-15T18:45:40+08:00
 * @Email:  jijm@bosc.cn
 * @Project: JJMproject
 * @Filename: NetworkUtility.js
 * @Last modified by:   jjm
 * @Last modified time: 2018-01-15T18:59:38+08:00
 */
 import {NetworkModule} from '../../native-modules/NativeModules';

 const NetworkUtility = {


};

/**
 * 网络请求: Callback形式
 */
function sendSilenceRequest(subUrl, params, resendRequest, errorMessage, silence, successCallback, failureCallback) {
    let url = Constant.baseURL + subUrl;
    const parameters = toString(params);
    DebugUtility.log(`==== url ====>>>>> ${url}`);
    DebugUtility.log(`==== params ====>>>>> ${parameters}`);
    NetworkModule.sendRequest(url, parameters, (result) => {
        responseHandler(result, silence, (response) => {
            successCallback(response.bsadata);
        }, (response) => {
            failureHandler(response, subUrl, params, resendRequest, errorMessage, silence, successCallback, failureCallback);
        });
    }, (error) => {
        DialogUtility.dismissLoading();
        exceptionHandler(error, failureCallback, silence, params);
    });
}
export default NetworkUtility;
