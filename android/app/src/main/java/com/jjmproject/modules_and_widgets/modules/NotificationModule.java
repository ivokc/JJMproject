package com.jjmproject.modules_and_widgets.modules;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.jjmproject.R;
import com.jjmproject.utilities.NotificationUtility;

/**
 * package: com.jjmproject.modules_and_widgets.modules
 * author: ivokc
 * email: jijm@bosc.cn
 * github: https://github.com/ivokc
 * date: 2017/12/13
 * desc:
 */

public class NotificationModule extends ReactContextBaseJavaModule {

    public NotificationModule(ReactApplicationContext reactContext) {
        super(reactContext);
    }

    @Override
    public String getName() {
        return "NotificationModule";
    }

    public void showNotification (String title, String message, String activityName){
        try {
            NotificationUtility.showNotification(R.mipmap.ic_launcher, title, message, Class.forName(activityName));
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
