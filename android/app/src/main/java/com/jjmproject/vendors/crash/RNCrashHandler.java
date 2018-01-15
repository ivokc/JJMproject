package com.jjmproject.vendors.crash;

import com.facebook.react.bridge.NativeModuleCallExceptionHandler;

/**
 * Created by MeePwn on 2017/7/26.
 */

public abstract class RNCrashHandler implements NativeModuleCallExceptionHandler {

    @Override
    public abstract void handleException(Exception e);
}
