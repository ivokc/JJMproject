package com.jjmproject.modules_and_widgets.modules;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.jjmproject.MainActivity;
import com.jjmproject.R;
import com.jjmproject.utilities.LogUtility;
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
    /**
     * 弹出消息通知
     */
    @ReactMethod
    public void showNotification (String title, String message, String activityName){
        try {
            LogUtility.i("activityname" ,activityName);
            Class activity = activityName.equals("this") ? getCurrentActivity().getClass() : Class.forName(activityName);
            NotificationUtility.showNotification(R.mipmap.ic_launcher, title, message, activity);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
