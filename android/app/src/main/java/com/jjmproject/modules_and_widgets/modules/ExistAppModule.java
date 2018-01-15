package com.jjmproject.modules_and_widgets.modules;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

/**
 * package: com.framework.modules_and_widgets.modules
 * author: MeePwn
 * email: maybewaityou@gmail.com
 * github: https://github.com/maybewaityou
 * date: 2017/3/20 上午9:21
 * desc:
 */

public class ExistAppModule extends ReactContextBaseJavaModule {

    public ExistAppModule(ReactApplicationContext reactContext) {
        super(reactContext);
    }

    @Override
    public String getName() {
        return "ExistAppModule";
    }

    @ReactMethod
    public void existApp() {
        System.exit(0);
    }

}
