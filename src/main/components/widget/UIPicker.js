import React, {PureComponent} from 'react';
import {
    StyleSheet,
    TouchableOpacity,
    Text,
    View
} from 'react-native';

const defaultProps = {

};

const defaultState = {

};

export default class UIPicker extends PureComponent {

    constructor(props) {
        super(props);
        this.state = defaultState;
    }

    render() {
        return (

                <TouchableOpacity
                      activeOpacity={0.8}
                      disabled={this.props.disabled}
                      style={[styles.container, this.props.style, this.props.disabled === true && styles.disabledBackground]}
                      onPress={() => {
                          Just.initPicker({
                              confirmButtonColor: [17,119,219, 1],
                              cancelButtonColor: [17,119,219, 1],
                              confirmButtonText: '确定',
                              cancelButtonText: '取消',
                              titleText: this.props.pickerTitle,
                              data: this.props.data,
                              selectedValue: [this.props.value],
                              onPickerConfirm: this.props.onPickerConfirm,
                              onPickerCancel: this.props.onPickerCancel,
                          });
                          Just.showPicker();
                      }}>
                      {
                          this.props.placeholder && !this.props.value
                          ?
                          <Text style={[styles.textStyle,this.props.textStyle]}>{this.props.placeholder}</Text>
                          :
                          <Text style={[styles.textStyle,this.props.textStyle]}>{this.props.value}</Text>
                      }
              </TouchableOpacity>
        );
    }
}

UIPicker.defaultProps = defaultProps;

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
        fontSize: 16 ,
        textAlign: 'center',
        color:'#333333'
    },

    disabledBackground: {
        backgroundColor: Color.disabledBackgroundColor,
    }

});
