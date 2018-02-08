 import React, {PureComponent} from 'react';
 import {
     StyleSheet,
     TouchableHighlight,
     Text,
     Image,
     View
 } from 'react-native';



const defaultProps = {
    positive: true
};


export default class UIButton extends PureComponent {

    constructor(props) {
        super(props);
    }

    render() {
        let icon = this.props.icon ? (
            <Image
                source={this.props.icon}
                style={styles.iconStyle}
                resizeMode={Image.resizeMode.contain}
            />
        ) : (
            null
        );

        return (
            <TouchableHighlight
                underlayColor={this.props.underlayColor ? this.props.underlayColor : (this.props.positive ? Color.darkBlue : Color.darkGray)}
                style={[this.props.positive ? styles.buttonStyle : styles.negativeButtonStyle, this.props.style, this.props.disabled ? styles.disabledStyle : {opacity: 1}]}
                disabled={this.props.disabled}
                onPress={this.props.onPress}>
                <View style={styles.rowStyle}>
                    {icon}
                    <Text style={[styles.text, this.props.titleStyle]}>
                        {this.props.title}
                    </Text>
                </View>
            </TouchableHighlight>
        );
    }
}

UIButton.defaultProps = defaultProps;

const styles = StyleSheet.create({
    buttonStyle: {
        backgroundColor: Color.lightBlue,
        padding: 10,
        borderRadius: 10,
    },
    negativeButtonStyle: {
        backgroundColor: Color.lightGray,
        padding: 10,
        borderRadius: 10,
    },
    rowStyle: {
        flexDirection: 'row',
        justifyContent: 'center',
        alignItems: 'center'
    },
    iconStyle: {
        height: 30,
        width: 30,
        marginLeft: -60,
        marginRight: 60
    },
    text: {
        fontSize: Constant.buttonFontSize,
        color: 'white',
        fontWeight: 'bold',
        textAlign: 'center',
    },
    disabledStyle: {
        opacity: 0.5
    }

});
