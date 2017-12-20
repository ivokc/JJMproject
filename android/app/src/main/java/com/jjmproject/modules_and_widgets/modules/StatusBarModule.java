package com.jjmproject.modules_and_widgets.modules;

import android.graphics.Color;
import android.os.Build;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.UiThreadUtil;

/**
 * package: com.jjmproject.modules_and_widgets.modules
 * author: ivokc
 * email: jijm@bosc.cn
 * github: https://github.com/ivokc
 * date: 2017/12/14
 * desc:
 */

public class StatusBarModule extends ReactContextBaseJavaModule {

    public StatusBarModule(ReactApplicationContext reactContext) {
        super(reactContext);
    }

    @Override
    public String getName() {
        return "StatusBarModule";
    }

    @ReactMethod
    public void setHexColor(String hex) {
        int color = Color.parseColor(hex);
        setStatusColor(color);
    }

    @ReactMethod
    public void setRGB(int r, int g, int b) {
        int color = Color.rgb(r, g, b);
        setStatusColor(color);
    }

    @ReactMethod
    public void setARGB(int a, int r, int g, int b) {
        int color = Color.argb(a, r, g, b);
        setStatusColor(color);
    }

    void setStatusColor(final int color) {
        UiThreadUtil.runOnUiThread(() -> {
            if (Build.VERSION.SDK_INT >= 21) {
                Window window = getCurrentActivity().getWindow();
                window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
                window.setStatusBarColor(color);
            }
        });
    }

    @ReactMethod
    public void hideStatusBar() {
        UiThreadUtil.runOnUiThread(() -> {
            if (Build.VERSION.SDK_INT >= 21){
                View decorView = getCurrentActivity().getWindow().getDecorView();
                // Hide the status bar.
                int uiOptions = View.SYSTEM_UI_FLAG_FULLSCREEN|View.SYSTEM_UI_FLAG_LAYOUT_STABLE;
                decorView.setSystemUiVisibility(uiOptions);
                getCurrentActivity().getWindow().setStatusBarColor(Color.TRANSPARENT);
            }
        });
    }

    @ReactMethod
    public void showStatusBar() {
        UiThreadUtil.runOnUiThread(() -> {
            if (Build.VERSION.SDK_INT < 16)
                return;
            View decorView = getCurrentActivity().getWindow().getDecorView();
            // Hide the status bar.
            int uiOptions = View.SYSTEM_UI_FLAG_VISIBLE;
            decorView.setSystemUiVisibility(uiOptions);
        });
    }

}
