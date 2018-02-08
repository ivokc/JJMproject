import React, {Component} from 'react';
import {
    StyleSheet,
    View,
    Text,
    Image,
    Modal,
    TouchableHighlight,
    TouchableOpacity,
    DatePickerAndroid,
    TimePickerAndroid,
    DatePickerIOS,
    Platform,
    Animated
} from 'react-native';

import Moment from 'moment';

const FORMATS = {
    'date': 'YYYY-MM-DD',
    'datetime': 'YYYY-MM-DD HH:mm',
    'time': 'HH:mm'
};

const SUPPORTED_ORIENTATIONS = ['portrait', 'portrait-upside-down', 'landscape', 'landscape-left', 'landscape-right'];

class UIDatePicker extends Component {
    constructor(props) {
        super(props);
        this.state = {
            date: this.getDate(),
            modalVisible: false,
            animatedHeight: new Animated.Value(0)
        };

        this.datePicked = this.datePicked.bind(this);
        this.onPressDate = this.onPressDate.bind(this);
        this.onPressCancel = this.onPressCancel.bind(this);
        this.onPressConfirm = this.onPressConfirm.bind(this);
        this.onDatePicked = this.onDatePicked.bind(this);
        this.onTimePicked = this.onTimePicked.bind(this);
        this.onDatetimePicked = this.onDatetimePicked.bind(this);
        this.onDatetimeTimePicked = this.onDatetimeTimePicked.bind(this);
        this.setModalVisible = this.setModalVisible.bind(this);
    }

    componentWillMount() {
        // ignore the warning of Failed propType for date of DatePickerIOS, will remove after being fixed by official
        console.ignoredYellowBox = [
            'Warning: Failed propType'
            // Other warnings you don't want like 'jsSchedulingOverhead',
        ];
    }

    setModalVisible(visible) {
        const {height, duration} = this.props;

        // slide animation
        if (visible) {
            this.setState({modalVisible: visible});
            Animated.timing(
                this.state.animatedHeight,
                {
                    toValue: height,
                    duration: duration
                }
            ).start();
        } else {
            Animated.timing(
                this.state.animatedHeight,
                {
                    toValue: 0,
                    duration: duration
                }
            ).start(() => {
                this.setState({modalVisible: visible});
            });
        }
    }

    onStartShouldSetResponder(e) {
        return true;
    }

    onMoveShouldSetResponder(e) {
        return true;
    }

    onPressCancel() {
        this.setModalVisible(false);

        if (typeof this.props.onCloseModal === 'function') {
            this.props.onCloseModal();
        }
    }

    onPressConfirm() {
        this.datePicked();
        this.setModalVisible(false);

        if (typeof this.props.onCloseModal === 'function') {
            this.props.onCloseModal();
        }
    }

    getDate(date = this.props.date) {
        const {mode, minDate, maxDate, format = FORMATS[mode]} = this.props;

        // date默认值
        if (!date) {
            let now = new Date();
            if (minDate) {
                let _minDate = this.getDate(minDate);

                if (now < _minDate) {
                    return _minDate;
                }
            }

            if (maxDate) {
                let _maxDate = this.getDate(maxDate);

                if (now > _maxDate) {
                    return _maxDate;
                }
            }

            return now;
        }

        if (date instanceof Date) {
            return date;
        }

        return Moment(date, format).toDate();
    }

    getDateStr(date = this.props.date) {
        const {mode, format = FORMATS[mode]} = this.props;

        if (date instanceof Date) {
            return Moment(date).format(format);
        } else {
            return Moment(this.getDate(date)).format(format);
        }
    }

    datePicked() {
        if (typeof this.props.onDateChange === 'function') {
            this.props.onDateChange(this.getDateStr(this.state.date), this.state.date);
        }
    }


    onDatePicked({action, year, month, day}) {
        if (action !== DatePickerAndroid.dismissedAction) {
            this.setState({
                date: new Date(year, month, day)
            });
            this.datePicked();
        }
    }

    onTimePicked({action, hour, minute}) {
        if (action !== DatePickerAndroid.dismissedAction) {
            this.setState({
                date: Moment().hour(hour).minute(minute).toDate()
            });
            this.datePicked();
        }
    }

    onDatetimePicked({action, year, month, day}) {
        const {mode, format = FORMATS[mode], is24Hour = !format.match(/h|a/)} = this.props;

        if (action !== DatePickerAndroid.dismissedAction) {
            let timeMoment = Moment(this.state.date);

            TimePickerAndroid.open({
                hour: timeMoment.hour(),
                minute: timeMoment.minutes(),
                is24Hour: is24Hour
            }).then(this.onDatetimeTimePicked.bind(this, year, month, day));
        }
    }

    onDatetimeTimePicked(year, month, day, {action, hour, minute}) {
        if (action !== DatePickerAndroid.dismissedAction) {
            this.setState({
                date: new Date(year, month, day, hour, minute)
            });
            this.datePicked();
        }
    }

    onPressDate() {
        if (this.props.disabled) {
            return true;
        }

        // reset state
        this.setState({
            date: this.getDate()
        });

        if (Platform.OS === 'ios') {
            this.setModalVisible(true);
        } else {

            const {mode, format = FORMATS[mode], minDate, maxDate, is24Hour = !format.match(/h|a/)} = this.props;

            // 选日期
            if (mode === 'date') {
                DatePickerAndroid.open({
                    // date: this.state.date,
                    date: this.getDate(this.props.date),
                    minDate: minDate && this.getDate(minDate),
                    maxDate: maxDate && this.getDate(maxDate)
                }).then(this.onDatePicked);
            } else if (mode === 'time') {
                // 选时间

                let timeMoment = Moment(this.state.date);

                TimePickerAndroid.open({
                    hour: timeMoment.hour(),
                    minute: timeMoment.minutes(),
                    is24Hour: is24Hour
                }).then(this.onTimePicked);
            } else if (mode === 'datetime') {
                // 选日期和时间

                DatePickerAndroid.open({
                    // date: this.state.date,
                    date: this.getDate(this.props.date),
                    minDate: minDate && this.getDate(minDate),
                    maxDate: maxDate && this.getDate(maxDate)
                }).then(this.onDatetimePicked);
            }
        }

        if (typeof this.props.onOpenModal === 'function') {
            this.props.onOpenModal();
        }
    }


    randerIOSModal = () =>{
      const {
          mode,
          customStyles,
          minDate,
          maxDate,
          minuteInterval,
          timeZoneOffsetInMinutes,
          cancelBtnText,
          confirmBtnText
      } = this.props;

      return (<Modal
          transparent={true}
          animationType='none'
          visible={this.state.modalVisible}
          supportedOrientations={SUPPORTED_ORIENTATIONS}
          onRequestClose={() => {this.setModalVisible(false);}}
      >
          <View style={{flex: 1}}>
              <TouchableHighlight
                  style={styles.datePickerMask}
                  activeOpacity={1}
                  underlayColor={'#00000077'}
                  onPress={this.onPressCancel}
              >
                  <TouchableHighlight
                      underlayColor={'#fff'}
                      style={{flex: 1}}
                  >
                      <Animated.View
                          style={[styles.datePickerCon, {height: this.state.animatedHeight}, customStyles.datePickerCon]}
                      >
                          <DatePickerIOS
                              date={this.state.date}
                              mode={mode}
                              minimumDate={minDate && this.getDate(minDate)}
                              maximumDate={maxDate && this.getDate(maxDate)}
                              onDateChange={(date) => this.setState({date: date})}
                              minuteInterval={minuteInterval}
                              timeZoneOffsetInMinutes={timeZoneOffsetInMinutes}
                              style={[styles.datePicker, customStyles.datePicker]}
                          />
                          <TouchableHighlight
                              underlayColor={'transparent'}
                              onPress={this.onPressCancel}
                              style={[styles.btnText, styles.btnCancel, customStyles.btnCancel]}
                          >
                              <Text
                                  style={[styles.btnTextText, styles.btnTextCancel, customStyles.btnTextCancel]}
                              >
                                  {cancelBtnText}
                              </Text>
                          </TouchableHighlight>
                          <TouchableHighlight
                              underlayColor={'transparent'}
                              onPress={this.onPressConfirm}
                              style={[styles.btnText, styles.btnConfirm, customStyles.btnConfirm]}
                          >
                              <Text style={[styles.btnTextText, customStyles.btnTextConfirm]}>{confirmBtnText}</Text>
                          </TouchableHighlight>
                      </Animated.View>
                  </TouchableHighlight>
              </TouchableHighlight>
          </View>
      </Modal>)

    }

    render() {

        return (
            <View>
                <TouchableOpacity
                      activeOpacity={0.8}
                      disabled={this.props.disabled}
                      style={[styles.container, this.props.style, this.props.disabled && styles.disabledBackground]}
                      onPress={this.onPressDate}>
                      {
                          this.props.placeholder && !this.props.date
                          ?
                          <Text style={[styles.textStyle,this.props.textStyle]}>{this.props.placeholder}</Text>
                          :
                          <Text style={[styles.textStyle,this.props.textStyle]}>{this.getDateStr()}</Text>
                      }
              </TouchableOpacity>

              {Platform.OS === 'ios' && this.randerIOSModal()}
            </View>

        );
    }
}

UIDatePicker.defaultProps = {
    mode: 'date',
    date: '',
    // component height: 216(DatePickerIOS) + 1(borderTop) + 42(marginTop), IOS only
    height: 259,

    // slide animation duration time, default to 300ms, IOS only
    duration: 300,
    confirmBtnText: '确定',
    cancelBtnText: '取消',
    customStyles: {},

    // whether or not show the icon
    disabled: false,
    placeholder: '',
    modalOnResponderTerminationRequest: e => true
};

const styles = StyleSheet.create({

    container: {
        justifyContent: 'center',
        alignItems: 'center',
        width: 200 ,
        height: 50 ,
        borderColor: '#979797',
        borderWidth: 1.5,
        borderRadius: 10,
    },
    textStyle: {
        fontSize: 18,
        textAlign: 'center',
        color:'#333333'
    },

    disabledBackground: {
        backgroundColor: Color.disabledBackgroundColor,
    },

    datePickerMask: {
        flex: 1,
        alignItems: 'flex-end',
        flexDirection: 'row',
        backgroundColor: '#00000077'
    },
    datePickerCon: {
        backgroundColor: '#fff',
        height: 0,
        overflow: 'hidden'
    },
    btnText: {
        position: 'absolute',
        top: 0,
        height: 42,
        padding: 20,
        flexDirection: 'row',
        alignItems: 'center',
        justifyContent: 'center'
    },
    btnTextText: {
        fontSize: 16,
        color: '#46cf98'
    },
    btnTextCancel: {
        color: '#666'
    },
    btnCancel: {
        left: 0
    },
    btnConfirm: {
        right: 0
    },
    datePicker: {
        marginTop: 42,
        borderTopColor: '#ccc',
        borderTopWidth: 1
    }
});

export default UIDatePicker;
