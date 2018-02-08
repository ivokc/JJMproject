
import React, { PureComponent } from 'react';
import {
    StyleSheet,
    TextInput,
    Image,
    View,
} from 'react-native';



const defaultProps = {

};

const defaultState = {

};

export default class UIEditView extends PureComponent {

    constructor(props) {
        super(props);

        this.state = defaultState;
    }

    render() {
        return (
            <View style={[styles.container, this.props.style, this.props.disabled && styles.disabledBackground]}>
                <Image source={this.props.image} style={styles.imageStyle}/>
                <TextInput
                    autoFocus={this.props.autoFocus}
                    editable={!this.props.disabled}
                    placeholder={this.props.placeholder}
                    placeholderTextColor={this.props.placeholderTextColor}
                    value={this.props.value}
                    defaultValue={this.props.defaultValue}
                    keyboardType={this.props.keyboardType}
                    autoCapitalize={this.props.autoCapitalize}
                    secureTextEntry={this.props.secureTextEntry}
                    underlineColorAndroid='transparent'
                    style={[styles.textStyle, this.props.textStyle]}
                    onBlur={this.props.onBlur}
                    onFocus={this.props.onFocus}
                    onChange={this.props.onChange}
                    onChangeText={this.props.onChangeText}
                    onEndEditing={this.props.onEndEditing}
                    multiline={this.props.multiline}
                    numberOfLines={this.props.numberOfLines}
                />
            </View>
        );
    }
}


UIEditView.defaultProps = defaultProps;

const styles = StyleSheet.create({
    container: {
        flexDirection: 'row',
        alignItems: 'center',
        backgroundColor: 'white',
        borderRadius: 10,
        borderColor: '#979797',
        borderWidth: 1.5,
        width: 200 ,
        height: 50 ,
    },

    imageStyle: {
        width: 25,
        height: 25,
        marginLeft: 10,
    },
    textStyle: {
        paddingLeft: 10,
        paddingRight: 10,
        fontSize: 16,
        flex:1,
    },

    disabledBackground: {
        backgroundColor: Color.disabledBackgroundColor,
    }

});
