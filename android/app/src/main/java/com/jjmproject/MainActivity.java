package com.jjmproject;

import android.os.Bundle;
import android.util.Log;


public class MainActivity extends UIActivity {

    private static final String TAG = "xxxMainActivity";

    /**
     * Returns the name of the main component registered from JavaScript.
     * This is used to schedule rendering of the component.
     */
    @Override
    protected String getMainComponentName() {
        Log.d(TAG, "getMainComponentName: ");
        return "JJMproject";
    }



    @Override
    public void setContentView() {
        Log.d(TAG, "setContentView: ");
    }

    @Override
    public void initData() {
        Log.d(TAG, "initData: ");
    }

    @Override
    public void initViews() {

    }

    @Override
    public void setupViews() {

    }
}
