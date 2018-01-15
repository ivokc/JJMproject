package com.jjmproject.utilities;

import android.content.Context;

import com.facebook.react.bridge.UiThreadUtil;
import com.jjmproject.ui.widget.dialog.progressbar.ProgressBarDialog;

/**
 * package: com.jjmproject.utilities
 * author: ivokc
 * email: jijm@bosc.cn
 * github: https://github.com/ivokc
 * date: 2018/1/14
 * desc:
 */

public class ProgressBarUtility {

    private static Context mContext;

    private static ProgressBarDialog mProgressBarDialog;

    public static void init(Context context) {
        mContext = context;

        mProgressBarDialog = new ProgressBarDialog.Builder(context).build();
    }

    public static void showProgressBar() {
        UiThreadUtil.runOnUiThread(() -> {
            mProgressBarDialog.setMessage("").show();
        });
    }

    public static void showProgressBar(String message) {
        UiThreadUtil.runOnUiThread(() -> {
            mProgressBarDialog
                    .setMessage(message)
                    .show();
        });
    }

    public static void showProgressBar(boolean couldCancelable) {
        UiThreadUtil.runOnUiThread(() -> {
            mProgressBarDialog
                    .setCouldCancelable(couldCancelable)
                    .setMessage("")
                    .show();
        });
    }

    public static void showProgressBar(String message, boolean couldCancelable) {
        UiThreadUtil.runOnUiThread(() -> {
            mProgressBarDialog
                    .setCouldCancelable(couldCancelable)
                    .setMessage(message)
                    .show();
        });
    }

    /**
     * 关闭 ProgressBar
     */
    public static void dismissProgressBar() {
        UiThreadUtil.runOnUiThread(() -> mProgressBarDialog.dismiss());
    }
}
