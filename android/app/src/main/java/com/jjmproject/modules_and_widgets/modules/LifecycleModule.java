package com.jjmproject.modules_and_widgets.modules;

import com.facebook.react.bridge.LifecycleEventListener;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;

/**
 * package: com.jjmproject.modules_and_widgets.modules
 * author: ivokc
 * email: jijm@bosc.cn
 * github: https://github.com/ivokc
 * date: 2018/1/8
 * desc:
 */

public class LifecycleModule extends ReactContextBaseJavaModule {

    private LifecycleEventListener mLifecycleEventListener = new LifecycleEventListener() {
        @Override
        public void onHostResume() {

        }

        @Override
        public void onHostPause() {

        }

        @Override
        public void onHostDestroy() {

        }
    };

    public LifecycleModule(ReactApplicationContext reactContext) {
        super(reactContext);
        reactContext.addLifecycleEventListener(mLifecycleEventListener);
    }

    @Override
    public String getName() {
        return "LifecycleModule";
    }

}
