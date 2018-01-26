package com.jjmproject;

import android.os.Bundle;

import com.facebook.react.ReactActivity;
import com.jjmproject.initialize.Initialize;
import com.jjmproject.utilities.InfoDialogUtility;
import com.jjmproject.utilities.ProgressBarUtility;
import com.jjmproject.utilities.SplashScreenUtility;


public class MainActivity extends ReactActivity implements Initialize {

    private static final String TAG = "xxxMainActivity";

    /**
     * Returns the name of the main component registered from JavaScript.
     * This is used to schedule rendering of the component.
     */
    @Override
    protected String getMainComponentName() {
        return "JJMproject";
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        initialize();
    }



    @Override
    public void initialize() {



        /* 注意!! 此做法会导致Activity内存泄漏 start */
        // 打开欢迎页
//        SplashScreenUtility.show(this);
        // 初始化 Dialog 管理类
        InfoDialogUtility.init(this);
        // 初始化 ProgressBarDialog 管理类
        ProgressBarUtility.init(this);

        /* 注意!! 此做法会导致Activity内存泄漏 end */
    }
}
