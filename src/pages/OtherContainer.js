/**
 * Created by MeePwn
 * https://github.com/maybewaityou
 *
 * description:
 *
 */
import React from 'react';
import {
    StyleSheet,
    Text,
    Image,
    View,
    TouchableOpacity
} from 'react-native';
import { Button } from '../main/components/UIComponents';

export default class OtherContainer extends React.Component {

  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.text}>{JSON.stringify(this.props.navigation.state.params)}</Text>
        <Button title="go back" handlePress={() => {
          this.props.navigation.goBack();
        }} />
      </View>
    );
  }

}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  text: {
    fontSize: 20,
    marginBottom: 20,
  }
});
