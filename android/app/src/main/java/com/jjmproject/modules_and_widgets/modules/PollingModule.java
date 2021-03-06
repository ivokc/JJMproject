package com.jjmproject.modules_and_widgets.modules;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.jjmproject.constants.Constant;
import com.jjmproject.utilities.PollingUtility;

/**
 * package: com.jjmproject.modules_and_widgets.modules
 * author: ivokc
 * email: jijm@bosc.cn
 * github: https://github.com/ivokc
 * date: 2018/1/15
 * desc:
 */

public class PollingModule extends ReactContextBaseJavaModule {
    public PollingModule(ReactApplicationContext reactContext) {
        super(reactContext);
    }

    @Override
    public String getName() {
        return "PollingModule";
    }

    @ReactMethod
    public void startPolling(String service, int duration) {
        String serviceClsName =  Constant.packageName + ".services." + service;
        try {
            PollingUtility.startPollingService(getCurrentActivity(), duration, Class.forName(serviceClsName), service);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    @ReactMethod
    public void stopPolling(String service) {
        String serviceClsName =  Constant.packageName + ".services." + service;
        try {
            PollingUtility.stopPollingService(getCurrentActivity(), Class.forName(serviceClsName), service);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
