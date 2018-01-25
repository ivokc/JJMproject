/**
 * @Author: jjm
 * @Date:   2018-01-15T18:37:00+08:00
 * @Email:  jijm@bosc.cn
 * @Project: JJMproject
 * @Filename: DialogUtility.js
 * @Last modified by:   jjm
 * @Last modified time: 2018-01-15T18:39:54+08:00
 */
import { Platform } from 'react-native';
import { DialogModule, ProgressBarModule } from '../../native-modules/NativeModules';

 const DialogUtility = {

     showLoading(message) {
        if (message) {
            if (Platform.OS === 'android') {
                DialogModule.showLoadingWithMessageAndCancelable(message, false);
            } else {
                ProgressBarModule.showWithMessage(message);
            }
        } else {
            if (Platform.OS === 'android') {
                DialogModule.showLoadingWithCancelable(false);
            } else {
                ProgressBarModule.show();
            }
        }
    },

    dismissLoading() {
        if (Platform.OS === 'android') {
            DialogModule.dismissLoading();
        } else {
            ProgressBarModule.dismiss();
        }
    },

    showSuccess(message, positiveAction = () => {}, negativeAction) {
        if (negativeAction) {
            DialogModule.showSuccessWithActions(message, false, '确定', '取消', positiveAction, negativeAction);
        } else {
            DialogModule.showSuccessWithAction(message, false, '确定', '取消', positiveAction);
        }
    },

    showSuccessWithButtonsTitle(message, positiveAction = () => {}, negativeAction, buttonTexts = [ '是', '否' ]) {
        if (negativeAction) {
            DialogModule.showSuccessWithActions(message, false, buttonTexts[0], buttonTexts[1], positiveAction, negativeAction);
        } else {
            DialogModule.showSuccessWithAction(message, false, buttonTexts[0], buttonTexts[1], positiveAction);
        }
    },

    dismissSuccess() {
        if (Platform.OS === 'android') {
            DialogModule.dismissSuccess();
        } else {
            DialogModule.dismiss();
        }
    },

    showMessage(message, positiveAction = () => {}, negativeAction) {
        if (negativeAction) {
            DialogModule.showMessageWithActions(message, false, '确定', '取消', positiveAction, negativeAction);
        } else {
            DialogModule.showMessageWithAction(message, false, '确定', '取消', positiveAction);
        }
    },

    showMessageWithButtonsTitle(message, positiveAction = () => {}, negativeAction, buttonTexts = [ '是', '否' ]) {
        if (negativeAction) {
            DialogModule.showMessageWithActions(message, false, buttonTexts[0], buttonTexts[1], positiveAction, negativeAction);
        } else {
            DialogModule.showMessageWithAction(message, false, buttonTexts[0], buttonTexts[1], positiveAction);
        }
    },

    dismissMessage() {
        if (Platform.OS === 'android') {
            DialogModule.dismissMessage();
        } else {
            DialogModule.dismiss();
        }
    },

    showFailure(message, positiveAction = () => {}, negativeAction) {
        if (negativeAction) {
            DialogModule.showFailureWithActions(message, false, '确定', '取消', positiveAction, negativeAction);
        } else {
            DialogModule.showFailureWithAction(message, false, '确定', '取消', positiveAction);
        }
    },

    showFailureWithButtonsTitle(message, positiveAction = () => {}, negativeAction, buttonTexts = [ '是', '否' ]) {
        if (negativeAction) {
            DialogModule.showFailureWithActions(message, false, buttonTexts[0], buttonTexts[1], positiveAction, negativeAction);
        } else {
            DialogModule.showFailureWithAction(message, false, buttonTexts[0], buttonTexts[1], positiveAction);
        }
    },

    dismissFailure() {
        if (Platform.OS === 'android') {
            DialogModule.dismissFailure();
        } else {
            DialogModule.dismiss();
        }
    }
};

export default DialogUtility;
