package com.jjmproject;

import android.os.Bundle;
import android.util.Log;

import com.facebook.react.ReactActivity;
import com.jjmproject.initialize.UIinitialize;

/**
 * package: com.jjmproject
 * author: ivokc
 * email: jijm@bosc.cn
 * github: https://github.com/ivokc
 * date: 2017/12/14
 * desc:
 */

public abstract class UIActivity extends ReactActivity implements UIinitialize {
    private static final String TAG = "xxxUIActivity";
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        Log.d(TAG, "onCreate: ");
        setContentView();
        super.onCreate(savedInstanceState);

        initialize();
        initData();
        initViews();
        setupViews();
    }

    @Override
    public void initialize() {
        Log.d(TAG, "initialize: ");
    }
}
