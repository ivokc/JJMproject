package com.jjmproject.modules_and_widgets.modules;

import android.app.Activity;
import android.content.Intent;

import com.facebook.react.bridge.ActivityEventListener;
import com.facebook.react.bridge.BaseActivityEventListener;
import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableMap;
import com.jjmproject.constants.Constant;
import com.jjmproject.utilities.LogUtility;
import com.jjmproject.vendors.log.OrhanobutLogger;
import com.jjmproject.utilities.DataUtility;
import com.jjmproject.utilities.CameraUtility;

import org.json.JSONObject;

import java.io.IOException;

import static android.app.Activity.RESULT_OK;
import static com.jjmproject.utilities.CameraUtility.PHOTO_PATH;
import static com.jjmproject.utilities.CameraUtility.PHOTO_QUALITY;

/**
 * package: com.jjmproject.modules_and_widgets.modules
 * author: ivokc
 * email: jijm@bosc.cn
 * github: https://github.com/ivokc
 * date: 2017/12/18
 * desc:
 */

public class JumpToNativeModule extends ReactContextBaseJavaModule {

    private static int ACTIVITY_REQUEST_CODE = 100;

    private static final String E_FAILED_TO_CREATE_IMAGEFILE = "E_FAILED_TO_CREATE_IMAGEFILE";
    private static final String E_CAMERA_CANCELLED = "E_CAMERA_CANCELLED";




    private Promise mPromise;


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
    public void toActivity(String activityName, String params) {
        try {
            Activity currentActivity = getCurrentActivity();
            if (currentActivity != null) {
                LogUtility.d("------>>>> " + params);

                Intent intent = new Intent(currentActivity, Class.forName(activityName));
                intent.putExtra("params", params);
                currentActivity.startActivity(intent);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    @ReactMethod
    public void toActivityForResult(String activityName, String params, int requestCode, final Promise promise) {
        try {
            Activity currentActivity = getCurrentActivity();
            if (currentActivity != null) {
                LogUtility.d("------>>>> " + params);

                mPromise = promise;

                Intent intent = new Intent(currentActivity, Class.forName(activityName));
                intent.putExtra("params", params);
                currentActivity.startActivityForResult(intent, requestCode);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }



    @ReactMethod
    public void openCamera(float photoQuality, final Promise mCameraPromise) {
        Activity currentActivity = getCurrentActivity();
        if (currentActivity != null) {
            LogUtility.i("------>>>> " + photoQuality);
            mPromise = mCameraPromise;
            try {
                CameraUtility.openCamera(currentActivity,(int)(photoQuality * 100),Constant.CAMERA_REQUEST_CODE);
            } catch (IOException e) {
                e.printStackTrace();
                mPromise.reject(E_FAILED_TO_CREATE_IMAGEFILE, e);
                mPromise = null;
            }
        }
    }


    private final ActivityEventListener mActivityEventListener = new BaseActivityEventListener() {

        @Override
        public void onActivityResult(Activity activity, int requestCode, int resultCode, Intent data) {
            if (requestCode == Constant.CAMERA_REQUEST_CODE){
                if (mPromise != null) {
                    if (resultCode == Activity.RESULT_CANCELED) {
                        LogUtility.i("==== photoPath ====>>>>> " + "canceled");
                        mPromise.reject(E_CAMERA_CANCELLED, "camera was cancelled");
                        mPromise = null;
                    } else if (resultCode == Activity.RESULT_OK) {
                        LogUtility.i("==== photoPath ====>>>>> " + PHOTO_PATH);
                        String bitmapString = DataUtility.bitmapString(PHOTO_PATH,PHOTO_QUALITY);
                        mPromise.resolve(bitmapString);
                        mPromise = null;
                    }
                }
            }else if (requestCode == ACTIVITY_REQUEST_CODE) {
                if (mPromise != null) {
                    if (resultCode == Activity.RESULT_CANCELED) {
                        mPromise.reject(E_CAMERA_CANCELLED, "camera was cancelled");
                        mPromise = null;
                    } else if (resultCode == RESULT_OK) {
                        mPromise.resolve(data.getStringExtra("response"));
                        mPromise = null;
                    }
                }
            }

        }
    };

}
