import React, { Component } from 'react';
import {
	View,
	Text,
	StyleSheet,
	Animated,
	PanResponder,
	TouchableWithoutFeedback,
	ViewPropTypes
} from 'react-native';


export default class UISwitch extends Component {

	static defaultProps = {
			value: false,
			onValueChange: () => null,
			disabled: false,
			activeText: 'On',
			inActiveText: 'Off',
			backgroundActive: 'green',
			backgroundInactive: 'gray',
			circleActiveColor: 'white',
			circleInActiveColor: 'white',
	    circleBorderColor: 'rgb(100, 100, 100)',
			circleSize: 30,
			barHeight: null,
			circleBorderWidth: 1
	};

	constructor(props, context) {
		super(props, context);

		this.state = {
			value: props.value,
			transformSwitch: new Animated.Value(props.value ? props.circleSize / 2 : -props.circleSize / 2),
			backgroundColor: new Animated.Value(props.value ? 75 : -75),
			circleColor: new Animated.Value(props.value ? 75 : -75)
		};

		this.handleSwitch = this.handleSwitch.bind(this);
		this.animateSwitch = this.animateSwitch.bind(this);
	}

	componentWillReceiveProps(nextProps) {
		const { disabled } = this.props;
		if (nextProps.value === this.props.value) {
			return;
		}
		if (disabled) {
			return;
		}

		this.animateSwitch(nextProps.value, () => {
			this.setState({ value: nextProps.value });
		});
	}

	handleSwitch() {
		const { value } = this.state;
		const { onValueChange, disabled } = this.props;
		if (disabled) {
			return;
		}

		onValueChange(!this.state.value);

		this.animateSwitch(!value, () => {
			this.setState({ value: !value });
		});


		// this.animateSwitch(!value, () => {
		// 	this.setState({ value: !value }, () => onValueChange(this.state.value));
		// });
	}

	animateSwitch(value, cb = () => { }) {
		Animated.parallel([
			Animated.timing(this.state.transformSwitch, {
				toValue: value ? this.props.circleSize / 2 : -this.props.circleSize / 2,
				duration: 100
			}),
			Animated.timing(this.state.backgroundColor, {
				toValue: value ? 75 : -75,
				duration: 100
			}),
			Animated.timing(this.state.circleColor, {
				toValue: value ? 75 : -75,
				duration: 100
			})
		]).start(cb);
	}

	render() {
		const {
			transformSwitch,
			backgroundColor,
			circleColor,
		} = this.state;

		const {
			backgroundActive,
			backgroundInactive,
			circleActiveColor,
			circleInActiveColor,
			activeText,
			inActiveText,
			circleSize,
			style,
			activeTextStyle,
			inactiveTextStyle,
			barHeight,
      circleBorderColor,
			circleBorderWidth
		} = this.props;

		const interpolatedColorAnimation = backgroundColor.interpolate({
			inputRange: [-75, 75],
			outputRange: [backgroundInactive, backgroundActive]
		});

		const interpolatedCircleColor = circleColor.interpolate({
			inputRange: [-75, 75],
			outputRange: [circleInActiveColor, circleActiveColor]
		});

    return (
			<TouchableWithoutFeedback
        		onPress={this.handleSwitch}
			>
				<Animated.View
					style={[
						styles.container,
            style,
						{ backgroundColor: this.props.disabled?Color.disabledBackgroundColor:interpolatedColorAnimation, width: circleSize * 2, height: barHeight ? barHeight : circleSize, borderRadius: circleSize }
					]}
				>
					<Animated.View
						style={[
							styles.animatedContainer,
							{ left: transformSwitch, width: circleSize * 2 },
						]}
					>
						<Text style={[styles.text, styles.paddingRight, activeTextStyle]}>
							{activeText}
						</Text>
						<Animated.View style={[styles.circle, { borderWidth: circleBorderWidth, borderColor: this.props.disabled?'white':circleBorderColor, backgroundColor: this.props.disabled?Color.disabledBackgroundColor:interpolatedCircleColor, width: circleSize, height: circleSize, borderRadius: circleSize / 2 }]} />
						<Text style={[styles.text, styles.paddingLeft, inactiveTextStyle]}>
							{inActiveText}
						</Text>
					</Animated.View>
				</Animated.View>
			</TouchableWithoutFeedback>
		);
	}
}

const styles = StyleSheet.create({
	container: {
		width: 71,
		height: 30,
		borderRadius: 30,
		backgroundColor: 'black',
		overflow: 'hidden'
	},
	animatedContainer: {
		flex: 1,
		width: 78,
		flexDirection: 'row',
		justifyContent: 'center',
		alignItems: 'center',
	},
	circle: {
		width: 30,
		height: 30,
		borderRadius: 15,
		backgroundColor: 'white',
	},
	text: {
		color: 'white',
		backgroundColor: 'transparent'
	},
	paddingRight: {
		paddingRight: 5
	},
	paddingLeft: {
		paddingLeft: 5,
	}
});
