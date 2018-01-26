/**
 * @Author: jjm
 * @Date:   2018-01-26T16:48:12+08:00
 * @Email:  jijm@bosc.cn
 * @Project: JJMproject
 * @Filename: UIEditView.js
 * @Last modified by:   jjm
 * @Last modified time: 2018-01-26T17:03:40+08:00
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
    TextInput,
    Image,
    View
} from 'react-native';

// const propTypes = {
//     autoFocus: PropTypes.bool,
//     editable: PropTypes.bool,
//     value: PropTypes.string,
//     defaultValue: PropTypes.string,
//     keyboardType: PropTypes.oneOf(['default', 'numeric', 'email-address', 'ascii-capable', 'numbers-and-punctuation', 'url', 'number-pad', 'phone-pad', 'name-phone-pad', 'decimal-pad', 'twitter', 'web-search']),
//     autoCapitalize: PropTypes.oneOf(['none', 'sentences', 'words', 'characters']),
//     placeholder: PropTypes.string,
//     secureTextEntry: PropTypes.bool,
//     style: PropTypes.any,
//     editViewStyle: PropTypes.any,
//     onBlur: PropTypes.func,
//     onFocus: PropTypes.func,
//     onChange: PropTypes.func,
//     onChangeText: PropTypes.func,
//     onEndEditing: PropTypes.func,
// };//弃用

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
            <View style={[styles.container, this.props.style, this.props.editable === false ? styles.disabledBackground : {}]}>
                <Image source={this.props.image} style={styles.imageStyle}/>
                <TextInput
                    autoFocus={this.props.autoFocus}
                    editable={this.props.editable}
                    placeholder={this.props.placeholder}
                    value={this.props.value}
                    defaultValue={this.props.defaultValue}
                    keyboardType={this.props.keyboardType}
                    autoCapitalize={this.props.autoCapitalize}
                    secureTextEntry={this.props.secureTextEntry}
                    underlineColorAndroid='transparent'
                    style={[styles.editViewStyle, this.props.editViewStyle]}
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

// UIEditView.propTypes = propTypes;//弃用
UIEditView.defaultProps = defaultProps;

const styles = StyleSheet.create({
    container: {
        flexDirection: 'row',
        alignItems: 'center',
        backgroundColor: 'white',
        borderRadius: 10,
        borderColor: '#979797',
        borderWidth: 1,
    },
    imageStyle: {
        width: 25,
        height: 25,
        marginLeft: 10,

    },
    editViewStyle: {
        flex: 1,
        height: Constant.editLayoutHeight,
        paddingLeft: 10,
        paddingRight: 10,
        fontSize: Constant.smallFontSize,

    },

    disabledBackground: {
        backgroundColor: Color.disabledBackgroundColor,
    }

});
