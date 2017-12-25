package com.jjmproject.modules_and_widgets.modules;

import android.app.Activity;
import android.content.Intent;

import com.facebook.react.bridge.ActivityEventListener;
import com.facebook.react.bridge.BaseActivityEventListener;
import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.jjmproject.constants.Constant;
import com.jjmproject.log.JLog;
import com.jjmproject.util.DataUtil;
import com.jjmproject.utilities.CameraUtility;

import java.io.File;

import static com.jjmproject.utilities.CameraUtility.PHOTO_PATH;

/**
 * package: com.jjmproject.modules_and_widgets.modules
 * author: ivokc
 * email: jijm@bosc.cn
 * github: https://github.com/ivokc
 * date: 2017/12/18
 * desc:
 */

public class JumpToNativeModule extends ReactContextBaseJavaModule {


    private Callback mSuccessCallback;
    private Callback mFailureCallback;


    public JumpToNativeModule(ReactApplicationContext reactContext) {
        super(reactContext);
        // Add the listener for `onActivityResult`
        reactContext.addActivityEventListener(mActivityEventListener);
    }

    @Override
    public String getName() {
        return "JumpToNativeModule";
    }

    @ReactMethod
    public void openCamera(String params, final Callback successCallback, final Callback failureCallback) {
        Activity currentActivity = getCurrentActivity();
        if (currentActivity != null) {
            JLog.d("------>>>> " + params);

            mSuccessCallback = successCallback;
            mFailureCallback = failureCallback;

            CameraUtility.openCamera(currentActivity, Constant.CAMERA_REQUEST_CODE);
        }
    }


    private final ActivityEventListener mActivityEventListener = new BaseActivityEventListener() {

        @Override
        public void onActivityResult(Activity activity, int requestCode, int resultCode, Intent data) {
            if (requestCode == Constant.CAMERA_REQUEST_CODE){
                if (mSuccessCallback != null && mFailureCallback != null){
                    if (resultCode == Activity.RESULT_CANCELED){
                        mFailureCallback.invoke("failure");
                    }else if (resultCode == Activity.RESULT_OK){
                        JLog.d("==== photoPath ====>>>>> " + PHOTO_PATH);
                        String bitmapString = DataUtil.bitmapString(PHOTO_PATH);
                        mSuccessCallback.invoke(bitmapString);
                        mSuccessCallback = null;
                        File photoFile = new File(PHOTO_PATH);
                        photoFile.delete();
                    }
                }
            }

        }
    };

}
