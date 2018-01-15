package com.jjmproject.modules_and_widgets.modules;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.jjmproject.utilities.LogUtility;

/**
 * package: com.jjmproject.modules_and_widgets.modules
 * author: ivokc
 * email: jijm@bosc.cn
 * github: https://github.com/ivokc
 * date: 2018/1/15
 * desc:
 */

public class LogModule extends ReactContextBaseJavaModule {

    public LogModule(ReactApplicationContext reactContext) {
        super(reactContext);
    }

    @Override
    public String getName() {
        return "LogModule";
    }

    @ReactMethod
    public void log(String json) {
        LogUtility.json(json);
    }


}
