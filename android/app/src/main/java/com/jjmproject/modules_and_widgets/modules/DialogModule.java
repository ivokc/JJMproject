package com.jjmproject.modules_and_widgets.modules;

import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.jjmproject.utilities.InfoDialogUtility;
import com.jjmproject.utilities.ProgressBarUtility;

/**
 * package: com.jjmproject.modules_and_widgets.modules
 * author: ivokc
 * email: jijm@bosc.cn
 * github: https://github.com/ivokc
 * date: 2018/1/12
 * desc:
 */

public class DialogModule extends ReactContextBaseJavaModule {

    public DialogModule(ReactApplicationContext reactContext) {
        super(reactContext);
    }

    @Override
    public String getName() {
        return "DialogModule";
    }

    @ReactMethod
    public void showLoading() {
        ProgressBarUtility.showProgressBar();
    }

    @ReactMethod
    public void showLoadingWithMessage(String message) {
        ProgressBarUtility.showProgressBar(message);
    }

    @ReactMethod
    public void showLoadingWithCancelable(boolean couldCancelable) {
        ProgressBarUtility.showProgressBar(couldCancelable);
    }

    @ReactMethod
    public void showLoadingWithMessageAndCancelable(String message, boolean couldCancelable) {
        ProgressBarUtility.showProgressBar(message, couldCancelable);
    }

    @ReactMethod
    public void dismissLoading() {
        ProgressBarUtility.dismissProgressBar();
    }

    @ReactMethod
    public void showSuccessWithActions(String message, boolean couldCancelable, String positiveTitle, String negativeTitle, Callback positiveAction, Callback negativeAction) {
        InfoDialogUtility.showSuccess(message, couldCancelable, positiveTitle, negativeTitle, v -> {
            InfoDialogUtility.dismissSuccess();
            positiveAction.invoke();
        }, v -> {
            InfoDialogUtility.dismissSuccess();
            negativeAction.invoke();
        });
    }

    @ReactMethod
    public void showSuccessWithAction(String message, boolean couldCancelable, String positiveTitle, String negativeTitle, Callback positiveAction) {
        InfoDialogUtility.showSuccess(message, couldCancelable, positiveTitle, negativeTitle, v -> {
            InfoDialogUtility.dismissSuccess();
            positiveAction.invoke();
        }, null);
    }

    @ReactMethod
    public void dismissSuccess() {
        InfoDialogUtility.dismissSuccess();
    }

    @ReactMethod
    public void showMessageWithActions(String message, boolean couldCancelable, String positiveTitle, String negativeTitle, Callback positiveAction, Callback negativeAction) {
        InfoDialogUtility.showMessage(message, couldCancelable, positiveTitle, negativeTitle, v -> {
            InfoDialogUtility.dismissMessage();
            positiveAction.invoke();
        }, v -> {
            InfoDialogUtility.dismissMessage();
            negativeAction.invoke();
        });
    }

    @ReactMethod
    public void showMessageWithAction(String message, boolean couldCancelable, String positiveTitle, String negativeTitle, Callback positiveAction) {
        InfoDialogUtility.showMessage(message, couldCancelable, positiveTitle, negativeTitle, v -> {
            InfoDialogUtility.dismissMessage();
            positiveAction.invoke();
        }, null);
    }

    @ReactMethod
    public void dismissMessage() {
        InfoDialogUtility.dismissMessage();
    }

    @ReactMethod
    public void showFailureWithActions(String message, boolean couldCancelable, String positiveTitle, String negativeTitle, Callback positiveAction, Callback negativeAction) {
        InfoDialogUtility.showFailure(message, couldCancelable, positiveTitle, negativeTitle, v -> {
            InfoDialogUtility.dismissFailure();
            positiveAction.invoke();
        }, v -> {
            InfoDialogUtility.dismissFailure();
            negativeAction.invoke();
        });
    }

    @ReactMethod
    public void showFailureWithAction(String message, boolean couldCancelable, String positiveTitle, String negativeTitle, Callback positiveAction) {
        InfoDialogUtility.showFailure(message, couldCancelable, positiveTitle, negativeTitle, v -> {
            InfoDialogUtility.dismissFailure();
            positiveAction.invoke();
        }, null);
    }

    @ReactMethod
    public void dismissFailure() {
        InfoDialogUtility.dismissFailure();
    }















}
