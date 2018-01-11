package com.jjmproject;

import android.os.Bundle;
import android.util.Log;

import com.facebook.react.ReactActivity;
import com.jjmproject.initialize.Initialize;
import com.jjmproject.utilities.SplashScreenUtility;
import com.orhanobut.logger.Logger;


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

        SplashScreenUtility.show(this);
    }
}
