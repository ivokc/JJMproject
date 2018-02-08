
import React, { PureComponent } from 'react';
import {StyleSheet,Text,View} from 'react-native';


const defaultProps = {

};

const defaultState = {

};

export default class UIDisplayLabel extends PureComponent {

    constructor(props) {
        super(props);
        this.state = defaultState;
    }

    render() {
        return (
            <View style={[styles.container, this.props.style]}>
                <Text style={[styles.text, this.props.textStyle, this.props.titleStyle]}>
                    {this.props.title}
                </Text>
                <Text style={[styles.text, this.props.textStyle, styles.divideText]}>
                    :
                </Text>
                <Text style={[styles.text, this.props.textStyle, this.props.contentStyle]}>
                    {this.props.content}
                </Text>
            </View>
        );
    }
}

UIDisplayLabel.defaultProps = defaultProps;

const styles = StyleSheet.create({
    container: {
        flexDirection: 'row',
        alignItems: 'center'
    },
    text: {
        fontSize: 16,
        textAlign: 'center'
    },
    divideText: {
        marginHorizontal: 10,
    }

});
