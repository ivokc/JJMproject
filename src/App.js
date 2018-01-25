/**
 * @Author: jjm <ivokc>
 * @Date:   2017-12-05T16:00:12+08:00
 * @Email:  jijm@bosc.cn
 * @Project: JJMproject
 * @Filename: App.js
 * @Last modified by:   jjm
 * @Last modified time: 2017-12-28T14:06:13+08:00
 */



/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */
import './main/constant/Color';
import './main/constant/Constant'
import './main/global/Just';

import React, { Component } from 'react';
import InitializeConfig from './main/initialize/InitializeConfig';
import { Provider } from 'react-redux';
import { TestNavigatorContainer } from './pages/NavigatorContainer';
import store from './dataflow/store/Store';

export default class JJMApp extends Component {

  componentWillMount() {
      InitializeConfig.setupAppConfiguration();
  }

  componentDidMount() {

  }

  // handlePress(){
  //     Just.openCamera('jjm').then((response)=>{
  //         console.log('handlePress',response);
  //     }).catch((error) =>{
  //         console.log('handlePress',error);
  //     });
  // }

  render() {
    return (
      <Provider store={store}>
        <TestNavigatorContainer />
      </Provider>
    );
  }
}
