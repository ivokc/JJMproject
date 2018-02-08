
import React from 'react';
import {
    StyleSheet,
    Text,
    Image,
    View,
    ScrollView
} from 'react-native';
import { Button,DatePicker,EditView,Picker,FormItem,DisplayLabel,Switch} from '../main/components/UIComponents';

const defaultState = {
    disabled:false
};

export default class FormPage extends React.Component {

  constructor(props) {
      super(props);
      this.state = defaultState;
  };



  render() {
    return (
        <ScrollView style={{backgroundColor:'white'}}>

          <DisplayLabel
              title='label'
              content='aaaaaaaaaaa'
              titleStyle={styles.formItemTitle}
              contentStyle={{color:'yellow'}}
              style={styles.formItem}/>

          <DatePicker
              disabled={this.state.disabled}
              style={styles.formItem}
              textStyle={{color:'red',fontSize:16}}
              mode='date'
              placeholder='DatePickerPlaceholder'
              format='YYYY-MM-DD'
              onDateChange={(value) => {this.setState({a:value})}}
              date={this.state.a}/>

          <Picker
              disabled={this.state.disabled}
              style={styles.formItem}
              textStyle={{color:'red',fontSize:16}}
              titleText='Picker标题'
              placeholder='PickerPlaceholder'
              data={['aaa','bbb','ccc','ddd']}
              onPickerConfirm={(value)=>{this.setState({b:value})}}
              onPickerCancel={()=>{}}
              value={this.state.b}/>

          <EditView
              disabled={this.state.disabled}
              style={styles.formItem}
              textStyle={{color:'red',fontSize:16}}
              placeholder='editViewplaceholder'
              placeholderTextColor='red'
              onChangeText= {(value)=>{this.setState({c:value})}}
              value={this.state.c}/>

          <FormItem
              disabled={this.state.disabled}
              type='datePicker'
              title='FormItemDatePicker'
              titleStyle={styles.formItemTitle}
              contentStyle={styles.formItem}
              textStyle={{color:'red',fontSize:16}}
              required={true}
              placeholder='datePickerplaceholder'
              onDateChange= {(value)=>{this.setState({d:value})}}
              value={this.state.d}/>

          <FormItem
              disabled={this.state.disabled}
              type='picker'
              title='FormItemPicker1'
              titleStyle={styles.formItemTitle}
              placeholder='pickerplaceholder'
              contentStyle={styles.formItem}
              textStyle={{color:'red',fontSize:16}}
              required={true}
              titleText='请选择'
              data={[1,2,3,4,5]}
              onPickerConfirm={(value)=>{this.setState({e:value})}}
              onPickerCancel={() => {}}
              value={this.state.e}/>

          <FormItem
              disabled={this.state.disabled}
              type='editView'
              title='FormItemEditView'
              titleStyle={styles.formItemTitle}
              contentStyle={styles.formItem}
              textStyle={{color:'red',fontSize:16}}
              required={true}
              placeholder='editViewplaceholder'
              placeholderTextColor='red'
              onChangeText= {(value)=>{this.setState({f:value})}}
              value={this.state.f}/>

          <FormItem
              disabled={this.state.disabled}
              type='button'
              title='FormItemButton'
              buttonTitle='GO BACK'
              titleStyle={styles.formItemTitle}
              contentStyle={styles.formItem}
              textStyle={{color:'red',fontSize:16}}
              required={true}
              onPress={()=>{this.props.navigation.goBack();}}/>

          <Switch
              style={{margin:10}}
              value={this.state.g}
              onValueChange={(value) => {this.setState({g:value})}}
              disabled={this.state.disabled}
              activeText={'On'}
              inActiveText={'Off'}
              circleSize={50}
              barHeight={50}
              circleBorderWidth={1}
              backgroundActive={'green'}
              circleActiveColor={'white'}
              backgroundInactive={'grey'}
              circleInActiveColor={'white'}/>

          <FormItem
              type='switch'
              title='切换表单禁用状态'
              titleStyle={styles.formItemTitle}
              style={{margin:10}}
              value={this.state.disabled}
              onValueChange={(value) => {this.setState({disabled:value})}}
              disabled={false}
              activeText={'On'}
              inActiveText={'Off'}
              circleSize={50}
              barHeight={50}
              circleBorderWidth={1}
              backgroundActive={'green'}
              circleActiveColor={'white'}
              backgroundInactive={'grey'}
              circleInActiveColor={'white'}/>

      </ScrollView>
    );
  }

}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },

  button: {
    justifyContent: 'center',
    alignItems: 'center',
    height: 50,
    backgroundColor: 'blue',
    marginLeft: 20,
    marginRight: 20,
  },
  buttonTitle: {
    fontSize: 20,
    color: 'white',
  },
  formItem:{
    margin:10,
    width: 300,
    height: 50,
  },
  formItemTitle:{
    color:'blue'
  }
});
