package com.jjmproject.modules_and_widgets.modules;

import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.LifecycleEventListener;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.jjmproject.utilities.NetworkUtility;

import java.util.HashMap;
import java.util.Map;

/**
 * package: com.jjmproject.modules_and_widgets.modules
 * author: ivokc
 * email: jijm@bosc.cn
 * github: https://github.com/ivokc
 * date: 2018/1/8
 * desc:
 */

public class NetworkModule extends ReactContextBaseJavaModule {

    private Map<String, Callback> mSuccessCallbackMap;
    private Map<String, Callback> mFailureCallbackMap;



    public NetworkModule(ReactApplicationContext reactContext) {
        super(reactContext);
        mSuccessCallbackMap = new HashMap<>();
        mFailureCallbackMap = new HashMap<>();

    }

    @Override
    public String getName() {
        return "NetworkModule";
    }

    @ReactMethod
    public void sendRequest(String url, String paramsString, Callback successCallback, Callback failureCallback) {
        NetworkUtility.sendRequest(url, paramsString, (NetworkUtility.NetworkSuccessCallback) responseString -> {
            successCallback.invoke(responseString);
        }, (NetworkUtility.NetworkFailureCallback) error -> {
            failureCallback.invoke(error.toString());
        });
    }





//    @ReactMethod
//    public void networkStatus(Callback callback) {
//        callback.invoke(NetworkUtility.networkStatus());
//    }

    @ReactMethod
    public void isNetworkConnected(Callback callback) {
        callback.invoke(NetworkUtility.isNetworkConnected());
    }

    @ReactMethod
    public void isWifiEnabled(Callback callback) {
        callback.invoke(NetworkUtility.isWifiEnabled());
    }

    @ReactMethod
    public void isWifi(Callback callback) {
        callback.invoke(NetworkUtility.isWifi());
    }

    @ReactMethod
    public void is3G(Callback callback) {
        callback.invoke(NetworkUtility.is3G());
    }

    @ReactMethod
    public void fetchIPAddress(Callback callback) {
        callback.invoke(NetworkUtility.fetchIPAddress());
    }

    @ReactMethod
    public void fetchMacAddress(Callback callback) {
        callback.invoke(NetworkUtility.fetchMacAddress());
    }

}
