package com.jjmproject.modules_and_widgets;

import com.facebook.react.ReactPackage;
import com.facebook.react.bridge.NativeModule;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.uimanager.ViewManager;
import com.jjmproject.modules_and_widgets.modules.DialogModule;
import com.jjmproject.modules_and_widgets.modules.ExitAppModule;
import com.jjmproject.modules_and_widgets.modules.ImageCacheModule;
import com.jjmproject.modules_and_widgets.modules.JumpToNativeModule;
import com.jjmproject.modules_and_widgets.modules.LogModule;
import com.jjmproject.modules_and_widgets.modules.MdmAuthModule;
import com.jjmproject.modules_and_widgets.modules.NetworkModule;
import com.jjmproject.modules_and_widgets.modules.NotificationModule;
import com.jjmproject.modules_and_widgets.modules.PickerViewModule;
import com.jjmproject.modules_and_widgets.modules.PollingModule;
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
        modules.add(new JumpToNativeModule(reactContext));
        modules.add(new NetworkModule(reactContext));
        modules.add(new DialogModule(reactContext));
        modules.add(new ExitAppModule(reactContext));
        modules.add(new ImageCacheModule(reactContext));
        modules.add(new LogModule(reactContext));
        modules.add(new PickerViewModule(reactContext));
        modules.add(new PollingModule(reactContext));
        modules.add(new MdmAuthModule(reactContext));

        return modules;
    }

    @Override
    public List<ViewManager> createViewManagers(ReactApplicationContext reactContext) {
        return Collections.emptyList();
    }
}
