/**
 * @Author: jjm
 * @Date:   2018-01-26T16:46:51+08:00
 * @Email:  jijm@bosc.cn
 * @Project: JJMproject
 * @Filename: UIFormItem.js
 * @Last modified by:   jjm
 * @Last modified time: 2018-01-26T16:52:47+08:00
 */

import React, { PureComponent } from 'react';
import {
    StyleSheet,
    Text,
    TouchableOpacity,
    View
} from 'react-native';

import UIEditView from '../widget/UIEditView';
import UIButton from '../widget/UIButton';
import UIPicker from '../widget/UIPicker';
import UIDatePicker from '../widget/UIDatePicker';
import UISwitch from '../widget/UISwitch';

const defaultProps = {
    type: 'editView',
    required: false
};

const defaultState = {

};

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
                handlePress={this.props.handleButtonPress}
            />
        ) : (<View />);
        const starComponent = this.props.required ? ( <Text style={[styles.starStyle,this.props.starStyle]}>*</Text> ) : ( <View style={styles.emptyStar} /> );
        return (
            <View style={[styles.container, this.props.style]}>
                <Text style={[styles.titleStyle, this.props.titleStyle]}>{this.props.title + ' :  '}</Text>
                <UIEditView
                    disabled={this.props.disabled}
                    placeholder={this.props.placeholder}
                    placeholderTextColor={this.props.placeholderTextColor}
                    value={this.props.value}
                    defaultValue ={this.props.defaultValue}
                    keyboardType={this.props.keyboardType}
                    autoCapitalize={this.props.autoCapitalize}
                    secureTextEntry={this.props.secureTextEntry}
                    underlineColorAndroid='transparent'
                    style={[styles.contentStyle, this.props.buttonTitle ? this.props.hasBtnContentStyle : this.props.contentStyle]}
                    textStyle={this.props.textStyle}
                    onBlur={this.props.onBlur}
                    onFocus={this.props.onFocus}
                    onChange={this.props.onChange}
                    onChangeText={this.props.onChangeText}
                    onEndEditing={this.props.onEndEditing}
                />
                {buttonComponents}
                {starComponent}
            </View>
        );
    };

    renderDatePicker = () => {
        const buttonComponents = this.props.buttonTitle ? (
            <UIButton
                positive={true}
                title={this.props.buttonTitle}
                underlayColor={Color.darkOrange}
                disabled={this.props.buttonDisabled}
                style={[styles.buttonStyle, this.props.buttonStyle]}
                titleStyle={this.props.buttonTitleStyle}
                handlePress={this.props.handleButtonPress}
            />
        ) : (<View />);
        const starComponent = this.props.required ? ( <Text style={[styles.starStyle,this.props.starStyle]}>*</Text> ) : ( <View style={styles.emptyStar} /> );
        return (
            <View style={[styles.container, this.props.style]}>
                <Text style={[styles.titleStyle, this.props.titleStyle]}>{this.props.title + ' :  '}</Text>
                <UIDatePicker
                    style={this.props.contentStyle}
                    textStyle={this.props.textStyle}
                    date={this.props.value}
                    mode='date'
                    placeholder={this.props.placeholder}
                    format='YYYY-MM-DD'
                    disabled={this.props.disabled}
                    onDateChange={(date) => {
                        this.props.onDateChange(date);
                    }}
                />
                {buttonComponents}
                {starComponent}
            </View>
        );
    };


    renderButton = () => {
        const starComponent = this.props.required ? ( <Text style={[styles.starStyle,this.props.starStyle]}>*</Text> ) : ( <View style={styles.emptyStar} /> );
        return (
            <View style={[styles.container, this.props.style]}>
                <Text style={[styles.titleStyle, this.props.titleStyle]}>{this.props.title + ' :  '}</Text>
                <UIButton
                    positive={this.props.positive}
                    title={this.props.buttonTitle}
                    underlayColor={this.props.underlayColor}
                    disabled={this.props.disabled}
                    style={[styles.contentStyle, this.props.contentStyle]}
                    titleStyle={this.props.buttonTitleStyle}
                    onPress={this.props.onPress}
                />
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
                style={[styles.contentStyle, this.props.contentStyle]}
                titleStyle={this.props.buttonTitleStyle}
                handlePress={this.props.handleButtonPress}
            />
        ) : (<View />);
        const starComponent = this.props.required ? ( <Text style={[styles.starStyle,this.props.starStyle]}>*</Text> ) : ( <View style={styles.emptyStar} /> );
        return (
            <View style={[styles.container, this.props.style]}>
                <Text style={[styles.titleStyle, this.props.titleStyle]}>{this.props.title + ' :  '}</Text>
                <UIPicker
                    style={this.props.contentStyle}
                    textStyle={this.props.textStyle}
                    titleText={this.props.pickerTitle}
                    placeholder={this.props.placeholder}
                    disabled={this.props.disabled}
                    data={this.props.data}
                    value={this.props.value}
                    onPickerConfirm = {this.props.onPickerConfirm}
                    onPickerCancel = {this.props.onPickerCancel}
                />
                {buttonComponents}
                {starComponent}
            </View>
        );
    };

    renderSwitch = () => {

        return (
            <View style={[styles.container, this.props.style]}>
                <Text style={[styles.titleStyle, this.props.titleStyle]}>{this.props.title + ' :  '}</Text>
                <UISwitch
                    value={this.props.value}
                    onValueChange={this.props.onValueChange}
                    disabled={this.props.disabled}
                    activeText={this.props.activeText}
                    inActiveText={this.props.inActiveText}
                    circleSize={this.props.circleSize}
                    barHeight={this.props.barHeight}
                    circleBorderWidth={this.props.circleBorderWidth}
                    backgroundActive={this.props.backgroundActive}
                    circleActiveColor={this.props.circleActiveColor}
                    backgroundInactive={this.props.backgroundInactive}
                    circleInActiveColor={this.props.circleInActiveColor}
                />
            </View>
        );
    };


    render() {
        const component = this.props.type === 'editView' ? this.renderEditView() :
            this.props.type === 'button' ? this.renderButton() :
            this.props.type === 'datePicker' ? this.renderDatePicker() :
            this.props.type === 'picker' ? this.renderPicker() :
            this.props.type === 'switch' ? this.renderSwitch() : (<View />);

        return component;
    }
}

UIFormItem.defaultProps = defaultProps;

const styles = StyleSheet.create({
    container: {
        flexDirection: 'row',
        alignItems: 'center',
    },
    titleStyle: {
        width: 180,
        fontSize: 16,
        textAlign: 'right',
    },

    contentStyle: {
        width: 200,
        height: 60,
    },

    buttonTextStyle: {
        fontSize: Constant.fontSize,
        textAlign: 'center',
    },

    buttonStyle: {
        marginLeft: 15,
        paddingLeft: 5,
        paddingRight: 5,
        backgroundColor: Color.lightOrange
    },

    starStyle: {
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
