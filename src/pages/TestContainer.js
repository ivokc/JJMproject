/**
 * Created by MeePwn
 * https://github.com/maybewaityou
 *
 * description:
 *
 */
import React from 'react';
import { connect } from 'react-redux';
import { TEST_COUNT_PLUS, TEST_COUNT_MINUS, } from '../dataflow/actions/Actions';
import TestView from './TestView';

class TestContainer extends React.Component {

  handleCountPlusPress = () => {
    this.props.dispatch({
      type: TEST_COUNT_PLUS,
      payload: this.props.count + 1
    });
  }

  handleCountMinusPress = () => {
    this.props.dispatch({
      type: TEST_COUNT_MINUS,
      payload: this.props.count - 1
    });
  }

  handleNextPagePress = () => {
    this.props.navigation.navigate('OtherContainer', {
        title: '借记卡',
        subTitle: '卡激活',
        buttonTitle: '退出业务',
    });
  }

  goFormPagePress = () => {
    this.props.navigation.navigate('FormPage');
  }

  render() {
    return (
      <TestView
        data={this.props.count}
        handleCountPlusPress={this.handleCountPlusPress}
        handleCountMinusPress={this.handleCountMinusPress}
        handleNextPagePress={this.handleNextPagePress}
        goFormPagePress={this.goFormPagePress}
      />
    )
  }

}

function mapStateToProps(state) {
  return {
    count: state.countReducer.count
  };
}

export default connect(mapStateToProps)(TestContainer);
