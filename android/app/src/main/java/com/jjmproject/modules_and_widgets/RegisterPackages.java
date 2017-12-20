package com.jjmproject.modules_and_widgets;

import com.facebook.react.ReactPackage;
import com.facebook.react.bridge.NativeModule;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.uimanager.ViewManager;
import com.jjmproject.modules_and_widgets.modules.NotificationModule;
import com.jjmproject.modules_and_widgets.modules.SplashScreenModule;
import com.jjmproject.modules_and_widgets.modules.StatusBarModule;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * package: com.jjmproject.modules_and_widgets
 * author: ivokc
 * email: jijm@bosc.cn
 * github: https://github.com/ivokc
 * date: 2017/12/13
 * desc:
 */

public class RegisterPackages implements ReactPackage {

    @Override
    public List<NativeModule> createNativeModules(ReactApplicationContext reactContext) {

        List<NativeModule> modules = new ArrayList<>();
        modules.add(new NotificationModule(reactContext));
        modules.add(new StatusBarModule(reactContext));
        modules.add(new SplashScreenModule(reactContext));
        return modules;
    }

    @Override
    public List<ViewManager> createViewManagers(ReactApplicationContext reactContext) {
        return Collections.emptyList();
    }
}
