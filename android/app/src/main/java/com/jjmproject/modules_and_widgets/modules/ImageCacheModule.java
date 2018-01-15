package com.jjmproject.modules_and_widgets.modules;

import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.jjmproject.utilities.ImageCacheUtility;

/**
 * package: com.jjmproject.modules_and_widgets.modules
 * author: ivokc
 * email: jijm@bosc.cn
 * github: https://github.com/ivokc
 * date: 2018/1/15
 * desc:
 */

public class ImageCacheModule extends ReactContextBaseJavaModule {

    public ImageCacheModule(ReactApplicationContext reactContext) {
        super(reactContext);
    }

    @Override
    public String getName() {
        return "ImageCacheModule";
    }

    @ReactMethod
    public void cacheImage(String imageURL) {
        ImageCacheUtility.cacheImage(imageURL);
    }

    @ReactMethod
    public void imageCacheSize(Callback callback) {
        callback.invoke(ImageCacheUtility.imageCacheSize() + "");
    }

    @ReactMethod
    public void clearImageCache() {
        ImageCacheUtility.clearImageCache();
    }

}
