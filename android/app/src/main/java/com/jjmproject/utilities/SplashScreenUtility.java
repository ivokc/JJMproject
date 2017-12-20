package com.jjmproject.utilities;

import android.app.Activity;
import android.app.Dialog;

import com.jjmproject.R;

import java.lang.ref.WeakReference;

/**
 * package: com.framework.utilities
 * author: MeePwn
 * email: maybewaityou@gmail.com
 * github: https://github.com/maybewaityou
 * date: 2017/2/10 上午8:44
 * desc:
 */

public class SplashScreenUtility {

    private static Dialog mSplashDialog;
    private static WeakReference<Activity> mActivity;



    /**
     * 打开启动屏
     */
    public static void show(final Activity activity, final boolean fullScreen) {
        if (activity == null) return;
        mActivity = new WeakReference<>(activity);
        activity.runOnUiThread(() -> {
            if (!activity.isFinishing()) {

                mSplashDialog = new Dialog(activity, fullScreen ? R.style.SplashScreen_Fullscreen : R.style.SplashScreen_SplashTheme);
                mSplashDialog.setContentView(R.layout.dialog_splash_screen);
                mSplashDialog.setCancelable(false);

                if (!mSplashDialog.isShowing()) {
                    mSplashDialog.show();
                }
            }
        });
    }

    /**
     * 打开启动屏
     */
    public static void show(final Activity activity) {
        show(activity, false);
    }

    /**
     * 关闭启动屏
     */
    public static void hide(Activity activity) {
        if (activity == null) activity = mActivity.get();
        if (activity == null) return;

        activity.runOnUiThread(() -> {
            if (mSplashDialog != null && mSplashDialog.isShowing()) {
                mSplashDialog.dismiss();
            }
        });
    }

}
