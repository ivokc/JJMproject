/**
 * @Author: jjm
 * @Date:   2018-01-15T18:37:00+08:00
 * @Email:  jijm@bosc.cn
 * @Project: JJMproject
 * @Filename: DialogUtility.js
 * @Last modified by:   jjm
 * @Last modified time: 2018-01-15T18:39:54+08:00
 */
 import {DialogModule} from '../../native-modules/NativeModules';

 const DialogUtility = {

     showLoading(message) {
        if (message) {
            DialogModule.showLoadingWithMessageAndCancelable(message, false);
        } else {
            DialogModule.showLoadingWithCancelable(false);
        }
    },

    dismissLoading() {
        DialogModule.dismissLoading();
    },

    showSuccess(message, positiveAction, negativeAction) {
        if (negativeAction) {
            DialogModule.showSuccessWithActions(message, false, '确定', '取消', positiveAction, negativeAction);
        } else {
            DialogModule.showSuccessWithAction(message, false, '确定', '取消', positiveAction);
        }
    },

    showSuccessWithButtonsTitle(message, positiveAction, negativeAction, buttonTexts = [ '是', '否' ]) {
        if (negativeAction) {
            DialogModule.showSuccessWithActions(message, false, buttonTexts[0], buttonTexts[1], positiveAction, negativeAction);
        } else {
            DialogModule.showSuccessWithAction(message, false, buttonTexts[0], buttonTexts[1], positiveAction);
        }
    },

    dismissSuccess() {
        DialogModule.dismissSuccess();
    },

    showMessage(message, positiveAction, negativeAction) {
        if (negativeAction) {
            DialogModule.showMessageWithActions(message, false, '确定', '取消', positiveAction, negativeAction);
        } else {
            DialogModule.showMessageWithAction(message, false, '确定', '取消', positiveAction);
        }
    },

    showMessageWithButtonsTitle(message, positiveAction, negativeAction, buttonTexts = [ '是', '否' ]) {
        if (negativeAction) {
            DialogModule.showMessageWithActions(message, false, buttonTexts[0], buttonTexts[1], positiveAction, negativeAction);
        } else {
            DialogModule.showMessageWithAction(message, false, buttonTexts[0], buttonTexts[1], positiveAction);
        }
    },

    dismissMessage() {
        DialogModule.dismissMessage();
    },

    showFailure(message, positiveAction, negativeAction) {
        if (negativeAction) {
            DialogModule.showFailureWithActions(message, false, '确定', '取消', positiveAction, negativeAction);
        } else {
            DialogModule.showFailureWithAction(message, false, '确定', '取消', positiveAction);
        }
    },

    showFailureResend(message, positiveAction, negativeAction, buttonTexts = [ '是', '否' ]) {
        if (negativeAction) {
            DialogModule.showFailureWithActions(message, false, buttonTexts[0], buttonTexts[1], positiveAction, negativeAction);
        } else {
            DialogModule.showFailureWithAction(message, false, buttonTexts[0], buttonTexts[1], positiveAction);
        }
    },

    dismissFailure() {
        DialogModule.dismissFailure();
    }
};

export default DialogUtility;
