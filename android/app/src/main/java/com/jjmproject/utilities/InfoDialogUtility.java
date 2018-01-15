package com.jjmproject.utilities;

import android.content.Context;
import android.view.View;

import com.facebook.react.bridge.UiThreadUtil;
import com.jjmproject.ui.widget.dialog.info.FailureDialog;
import com.jjmproject.ui.widget.dialog.info.MessageDialog;
import com.jjmproject.ui.widget.dialog.info.SuccessDialog;

/**
 * package: com.jjmproject.utilities
 * author: ivokc
 * email: jijm@bosc.cn
 * github: https://github.com/ivokc
 * date: 2018/1/15
 * desc:
 */

public class InfoDialogUtility {

    private static Context mContext;
    private static SuccessDialog mSuccessDialog;
    private static FailureDialog mFailureDialog;
    private static MessageDialog mMessageDialog;

    public static void init(Context context) {
        mContext = context;

        mSuccessDialog = new SuccessDialog.Builder(mContext).build();
        mFailureDialog = new FailureDialog.Builder(mContext).build();
        mMessageDialog = new MessageDialog.Builder(mContext).build();
    }

    public static void showSuccess(String message, boolean couldCancelable, String positiveTitle, String negativeTitle, View.OnClickListener positiveListener, View.OnClickListener negativeListener) {
        UiThreadUtil.runOnUiThread(() -> {
            if (negativeListener == null) {
                mSuccessDialog.setMessage(message)
                        .setupButtonsAttrs(positiveTitle, negativeTitle, positiveListener, null)
                        .setCouldCancelable(couldCancelable)
                        .show();
            } else {
                mSuccessDialog.setMessage(message)
                        .setupButtonsAttrs(positiveTitle, negativeTitle, positiveListener, negativeListener)
                        .setCouldCancelable(couldCancelable)
                        .show();
            }
        });
    }

    public static void dismissSuccess() {
        UiThreadUtil.runOnUiThread(() -> {
            mSuccessDialog.dismiss();
        });
    }

    public static void showMessage(String message, boolean couldCancelable, String positiveTitle, String negativeTitle,  View.OnClickListener positiveListener, View.OnClickListener negativeListener) {
        UiThreadUtil.runOnUiThread(() -> {
            if (negativeListener == null) {
                mMessageDialog.setMessage(message)
                        .setupButtonsAttrs(positiveTitle, negativeTitle, positiveListener, null)
                        .setCouldCancelable(couldCancelable)
                        .show();
            } else {
                mMessageDialog.setMessage(message)
                        .setupButtonsAttrs(positiveTitle, negativeTitle, positiveListener, negativeListener)
                        .setCouldCancelable(couldCancelable)
                        .show();
            }
        });
    }

    public static void dismissMessage() {
        UiThreadUtil.runOnUiThread(() -> {
            mMessageDialog.dismiss();
        });
    }

    public static void showFailure(String message, boolean couldCancelable, String positiveTitle, String negativeTitle, View.OnClickListener positiveListener, View.OnClickListener negativeListener) {
        UiThreadUtil.runOnUiThread(() -> {
            if (negativeListener == null) {
                mFailureDialog.setMessage(message)
                        .setupButtonsAttrs(positiveTitle, negativeTitle, positiveListener, null)
                        .setCouldCancelable(couldCancelable)
                        .show();
            } else {
                mFailureDialog.setMessage(message)
                        .setupButtonsAttrs(positiveTitle, negativeTitle, positiveListener, negativeListener)
                        .setCouldCancelable(couldCancelable)
                        .show();
            }
        });
    }

    public static void dismissFailure() {
        UiThreadUtil.runOnUiThread(() -> {
            mFailureDialog.dismiss();
        });
    }



}
