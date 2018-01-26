/**
 * @Author: jjm
 * @Date:   2018-01-26T16:46:51+08:00
 * @Email:  jijm@bosc.cn
 * @Project: JJMproject
 * @Filename: UIFormItem.js
 * @Last modified by:   jjm
 * @Last modified time: 2018-01-26T16:52:47+08:00
 */



/**
 * Created by MeePwn
 * https://github.com/maybewaityou
 *
 * description:
 *
 */
import React, { PureComponent, PropTypes } from 'react';
import {
    StyleSheet,
    Text,
    TouchableOpacity,
    View
} from 'react-native';
import UIEditView from '../widget/UIEditView';
import UIButton from '../widget/UIButton';
import UIDatePicker from '../widget/date-picker/UIDatePicker';


const propTypes = {
    type: PropTypes.oneOf(['editView', 'button', 'datePicker', 'picker']),
    title: PropTypes.string,
    value: PropTypes.any,
    defaultValue:PropTypes.string,
    buttonTitle: PropTypes.string,
    buttonDisabled: PropTypes.bool,
    editable: PropTypes.bool,
    disabled: PropTypes.bool,
    keyboardType: PropTypes.oneOf(['default', 'numeric', 'email-address', 'ascii-capable', 'numbers-and-punctuation', 'url', 'number-pad', 'phone-pad', 'name-phone-pad', 'decimal-pad', 'twitter', 'web-search']),
    placeholder: PropTypes.string,
    secureTextEntry: PropTypes.bool,
    style: PropTypes.any,
    titleStyle: PropTypes.any,
    editViewStyle: PropTypes.any,
    buttonStyle: PropTypes.any,
    buttonTitleStyle: PropTypes.any,
    fingerStyle: PropTypes.any,
    autoCapitalize: PropTypes.oneOf(['none', 'sentences', 'words', 'characters']),
    onBlur: PropTypes.func,
    onFocus: PropTypes.func,
    onChange: PropTypes.func,
    onChangeText: PropTypes.func,
    onEndEditing: PropTypes.func,
    onDateChange: PropTypes.func,
    handlePress: PropTypes.func,

    /* picker start */
    titleText: PropTypes.string,
    data: PropTypes.array,
    selectedValue: PropTypes.any,
    onPickerConfirm: PropTypes.func,
    onPickerCancel: PropTypes.func,
    /* picker end */

    required: PropTypes.bool, // 必填
};

const defaultProps = {
    type: 'editView',
    required: false
};

const defaultState = {

};

@pureRender
export default class UIFormItem extends PureComponent {

    constructor(props) {
        super(props);

        this.state = defaultState;
    }

    renderEditView = () => {
        const buttonComponents = this.props.buttonTitle ? (
            <UIButton
                positive={true}
                title={this.props.buttonTitle}
                underlayColor={Color.darkOrange}
                disabled={this.props.buttonDisabled}
                style={[styles.buttonStyle, this.props.buttonStyle]}
                titleStyle={this.props.buttonTitleStyle}
                handlePress={this.props.handlePress}
            />
        ) : (<View />);
        const starComponent = this.props.required ? ( <Text style={styles.star}>*</Text> ) : ( <View style={styles.emptyStar} /> );
        return (
            <View style={[styles.container, this.props.style]}>
                <Text style={[styles.titleStyle, this.props.titleStyle]}>{this.props.title + ' :  '}</Text>
                <UIEditView
                    editable={this.props.editable}
                    placeholder={this.props.placeholder}
                    value={this.props.value}
                    defaultValue ={this.props.defaultValue}
                    keyboardType={this.props.keyboardType}
                    autoCapitalize={this.props.autoCapitalize}
                    secureTextEntry={this.props.secureTextEntry}
                    underlineColorAndroid='transparent'
                    style={[styles.editViewStyle, this.props.buttonTitle ? this.props.hsBtnViewStyle : this.props.editViewStyle]}
                    onBlur={this.props.onBlur}
                    onFocus={this.props.onFocus}
                    onChange={this.props.onChange}
                    onChangeText={this.props.onChangeText}
                    onEndEditing={this.props.onEndEditing}
                />
                {starComponent}
                {buttonComponents}
            </View>
        );
    };

    renderDatePicker = () => {
        const starComponent = this.props.required ? ( <Text style={styles.star}>*</Text> ) : ( <View style={styles.emptyStar} /> );
        return (
            <View style={[styles.container, this.props.style]}>
                <Text style={[styles.titleStyle, this.props.textStyle]}>{this.props.title + ' :  '}</Text>
                <UIDatePicker
                    style={styles.datePickerLayout}
                    showIcon={false}
                    date={this.props.value}
                    mode='date'
                    placeholder='请选择'
                    format='YYYY-MM-DD'
                    confirmBtnText='确定'
                    cancelBtnText='取消'
                    disabled={this.props.disabled}
                    customStyles={{
                        dateInput: {
                            height: Constant.editLayoutHeight,
                            alignItems: 'flex-start',
                            paddingLeft: 15,
                            borderColor: 'gray',
                            borderRadius: 10,
                            borderWidth: 1,
                        },
                        dateText: {
                            fontSize: Constant.fontSize,
                        },
                        disabled: {
                            backgroundColor: Color.disabledBackgroundColor
                        }
                    }}
                    onDateChange={(date) => {
                        this.props.onDateChange(date);
                    }}
                />
                {starComponent}
            </View>
        );
    };


    renderButton = () => {
        const starComponent = this.props.required ? ( <Text style={styles.star}>*</Text> ) : ( <View style={styles.emptyStar} /> );
        return (
            <View style={[styles.container, this.props.style]}>
                <Text style={[styles.titleStyle, this.props.titleStyle]}>{this.props.title + ' :  '}</Text>
                <TouchableOpacity activeOpacity={0.8} disabled={this.props.disabled} style={[styles.pickerLayout, this.props.buttonStyle, this.props.disabled === true ? styles.disabledBackground : {}]} onPress={this.props.handlePress}>
                    <Text style={styles.pickerText}>{this.props.value}</Text>
                </TouchableOpacity>
                {starComponent}
            </View>
        );
    };

    renderPicker = () => {
        const buttonComponents = this.props.buttonTitle ? (
            <UIButton
                positive={true}
                title={this.props.buttonTitle}
                underlayColor={Color.darkOrange}
                disabled={this.props.buttonDisabled}
                style={[styles.buttonStyle, this.props.buttonStyle]}
                titleStyle={this.props.buttonTitleStyle}
                handlePress={this.props.handlePress}
            />
        ) : (<View />);
        const starComponent = this.props.required ? ( <Text style={styles.star}>*</Text> ) : ( <View style={styles.emptyStar} /> );
        return (
            <View style={[styles.container, this.props.style]}>
                <Text style={[styles.titleStyle, this.props.titleStyle]}>{this.props.title + ' :  '}</Text>
                <TouchableOpacity activeOpacity={0.8} disabled={this.props.disabled} style={[styles.pickerLayout, this.props.pickerStyle, this.props.disabled === true ? styles.disabledBackground : {}]} onPress={() => {
                    Just.initPicker({
                        confirmButtonColor: [17,119,219, 1],
                        cancelButtonColor: [17,119,219, 1],
                        confirmButtonText: '确定',
                        cancelButtonText: '取消',
                        titleText: this.props.titleText,
                        data: this.props.data,
                        selectedValue: [this.props.value],
                        onPickerConfirm: this.props.onPickerConfirm,
                        onPickerCancel: this.props.onPickerCancel,
                    });
                    Just.showPicker();
                }}>
                    <Text style={styles.pickerText}>{this.props.value}</Text>
                </TouchableOpacity>
                {starComponent}
                {buttonComponents}
            </View>
        );
    };


    render() {
        const component = this.props.type === 'editView' ? this.renderEditView() :
            this.props.type === 'button' ? this.renderButton() :
            this.props.type === 'datePicker' ? this.renderDatePicker() :
            this.props.type === 'picker' ? this.renderPicker() : (<View />);

        return component;
    }
}

UIFormItem.propTypes = propTypes;
UIFormItem.defaultProps = defaultProps;

const styles = StyleSheet.create({
    container: {
        flexDirection: 'row',
        alignItems: 'center',
    },
    titleStyle: {
        width: Constant.displayKeyLabelWidth,
        fontSize: Constant.fontSize,
        textAlign: 'right',
    },
    editViewStyle: {
        width: Constant.editLayoutWidth,

    },
    datePickerLayout: {
        width: Constant.editLayoutWidth,
    },
    pickerLayout: {
        justifyContent: 'center',
        alignItems: 'center',
        width: Constant.editLayoutWidth,
        height: Constant.editLayoutHeight,
        borderColor: 'gray',
        borderWidth: 1,
        borderRadius: 10,
    },
    pickerText: {
        fontSize: Constant.fontSize,
        textAlign: 'center',
    },
    buttonStyle: {
        marginLeft: 15,
        paddingLeft: 5,
        paddingRight: 5,
        backgroundColor: Color.lightOrange
    },
    text: {
        fontSize: Constant.fontSize,
        textAlign: 'center'
    },
    divideText: {
        marginLeft: 3,
        marginRight: 5
    },
    star: {
        fontSize: 16,
        color: 'red',
        marginLeft: 10,
    },
    emptyStar: {
        marginLeft: 10,
    },

    disabledBackground: {
        backgroundColor: Color.disabledBackgroundColor,

    },

});
