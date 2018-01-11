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

import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View
} from 'react-native';
import './main/constant/Color';
import './main/constant/Constant'
import './main/global/Just';
import InitializeConfig from './main/initialize/InitializeConfig';
import {Button} from './main/components/UIComponents';

const instructions = Platform.select({
  ios: 'Press Cmd+R to reload,\n' +
    'Cmd+D or shake for dev menu',
  android: 'Double tap R on your keyboard to reload,\n' +
    'Shake or press menu button for dev menu',
});


export default class JJMApp extends Component<{}> {

  componentWillMount() {
      InitializeConfig.setupAppConfiguration();
  }

  componentDidMount() {

  }

  handlePress(){
      Just.openCamera('jjm').then((response)=>{
          console.log('handlePress',response);
      }).catch((error) =>{
          console.log('handlePress',error);
      });
  }

  render() {

    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>
          Welcome to React Native!
        </Text>
        <Text style={styles.instructions}>
          To get started, edit App.js
        </Text>
        <Text style={styles.instructions}>
          {instructions}
      </Text>
        <Button title='确认' disabled={false}  handlePress={this.handlePress} />


      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});
