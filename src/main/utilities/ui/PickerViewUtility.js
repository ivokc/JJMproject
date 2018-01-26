/**
 * @Author: jjm
 * @Date:   2018-01-26T15:13:54+08:00
 * @Email:  jijm@bosc.cn
 * @Project: JJMproject
 * @Filename: PickerViewUtility.js
 * @Last modified by:   jjm
 * @Last modified time: 2018-01-26T16:54:44+08:00
 */



/**
 * Created by MeePwn
 * https://github.com/maybewaityou
 *
 * description:
 *
 */
import {
    Platform,
    NativeAppEventEmitter
} from 'react-native';

import { PickerModule,PickerViewModule } from '../../native-modules/NativeModules';

let ios = Platform.OS === 'ios';
let android = Platform.OS === 'android';

const PickerViewUtility = {

    initPicker(options) {
        if (options.data) {
            if (options.data.length === 0) {
                options.data = [''];
            }
        }
        let opt = {
            isLoop: false,
            confirmButtonText: 'confirm',
            cancelButtonText: 'cancel',
            titleText: 'title',
            confirmButtonColor: [1, 186, 245, 1],
            cancelButtonColor: [1, 186, 245, 1],
            titleColor: [20, 20, 20, 1],
            toolBarBackground: [232, 232, 232, 1],
            background: [196, 199, 206, 1],
            wheelFlex: [1, 1, 1],
            data: [''],
            selectedValue: [],
            onPickerConfirm(){},
            onPickerCancel(){},
            onPickerSelect(){},
            //4.0.12 add
            toolBarFontSize: 16,
            fontSize: 16,
            fontColor: [31, 31 ,31, 1],
            ...options
        };
        let fnConf = {
            confirm: opt.onPickerConfirm,
            cancel: opt.onPickerCancel,
            select: opt.onPickerSelect
        };

        PickerViewModule.initPicker(opt);
        // there are no `removeListener` for NativeAppEventEmitter & DeviceEventEmitter
        this.listener && this.listener.remove();
        this.listener = NativeAppEventEmitter.addListener('pickerEvent', (event) => {
            fnConf[event.type](event.selectedValue, event.selectedValue === '' ? -1 : event.selectedIndex);
        });
    },





    selectPicker(arr, fn) {
        if(ios){
            PickerViewModule.select(arr);
        } else if(android) {
            PickerViewModule.select(arr, (err) => {
                typeof fn === 'function' && fn(err);
            });
        }
    },

    togglePicker() {
        this.isPickerShow((show) => {
            if(show) {
                this.hidePicker();
            } else {
                this.showPicker();
            }
        });
    },

    isPickerShow(fn) {
        //android return two params: err(error massage) and status(show or not)
        //ios return only one param: hide or not...
        PickerViewModule.isPickerShow((err, status) => {
            let returnValue = null;
            if(android) {
                returnValue = err ? false : status;
            } else if(ios) {
                returnValue = !err;
            }
            fn(returnValue);
        });
    },

    showPicker(title, datas, badgeNumber) {
      if (Platform.OS === 'android') {
          PickerViewModule.show();
      } else {
        PickerModule.initPicker(datas,title,badgeNumber);
      }
    },
    hidePicker() {
        PickerViewModule.hide();
    },
    showDatePicker(title, badgeNumber) {
      if (Platform.OS === 'android') {

      } else {
        PickerModule.initDatePicker(title,badgeNumber);
      }
    }

};

export default PickerViewUtility;
