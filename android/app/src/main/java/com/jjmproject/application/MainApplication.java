package com.jjmproject.application;

import android.content.Context;
import android.util.Log;

import com.facebook.react.bridge.ReactApplicationContext;
import com.jjmproject.initialize.Initialize;
import com.jjmproject.utilities.NetworkUtility;
import com.jjmproject.vendors.log.OrhanobutLogger;
import com.jjmproject.utilities.NotificationUtility;

import java.util.HashMap;
import java.util.Map;

/**
 * package: com.jjmproject.application
 * author: ivokc
 * email: jijm@bosc.cn
 * github: https://github.com/ivokc
 * date: 2017/12/13
 * desc:
 */

public class MainApplication extends RNApplication implements Initialize{

    private static final String TAG = "xxxMainApplication";

    private static MainApplication instance;
    private static Context mContext;
    private static ReactApplicationContext mReactApplicationContext;
    private static Map<String, String> mRequestHeader;



    @Override
    public void onCreate() {
        super.onCreate();

        initialize();
    }

    @Override
    public void initialize() {
        instance = this;
        mContext = this;
        mRequestHeader = new HashMap<>();
        initUtilities();
    }

    /**
     * 初始化全局工具类
     */
    private void initUtilities() {
        Log.d(TAG, "initUtilities: ");

        // 初始化 Notification 工具类
        NotificationUtility.init(mContext);
        // 初始化日志类
        OrhanobutLogger.init();
        // 初始化 Network 工具类
        NetworkUtility.init(mContext);

    }

    public static MainApplication getInstance() {
        return instance;
    }


    public static ReactApplicationContext getmReactApplicationContext() {
        return mReactApplicationContext;
    }

    public static Map<String, String> getmRequestHeader() {
        return mRequestHeader;
    }

    public static void setmReactApplicationContext(ReactApplicationContext mReactApplicationContext) {
        MainApplication.mReactApplicationContext = mReactApplicationContext;
    }

    public static void setmRequestHeader(Map<String, String> mRequestHeader) {
        MainApplication.mRequestHeader = mRequestHeader;
    }
}
