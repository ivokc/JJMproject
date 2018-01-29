/**
 * @Author: jjm
 * @Date:   2018-01-22T10:39:17+08:00
 * @Email:  jijm@bosc.cn
 * @Project: JJMproject
 * @Filename: TestView.js
 * @Last modified by:   jjm
 * @Last modified time: 2018-01-29T17:36:35+08:00
 */



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
    TouchableOpacity,
    ScrollView
} from 'react-native';
import { Button,DatePicker } from '../main/components/UIComponents';

const log = console.log;

export default class TestView extends React.Component {

  constructor(props) {
      super(props);
      this.state = { imageData:'' };
  };



  render() {
    return (
        <ScrollView>
        <Text style={styles.testResult}>{this.props.data}</Text>

        <Button title="dispatch count ++" style={styles.marginTop} onPress={this.props.handleCountPlusPress} />
        <Button title="dispatch count --" style={styles.marginTop} onPress={this.props.handleCountMinusPress} />
        <Button title="发送请求" style={styles.marginTop} onPress={() => {
          Just.showLoading('正在发起网络请求, 请稍后...');
          Just.sendRequest('http://localhost:8000/get_data.json')
            .then((response) => {
              Just.dismissLoading();
              log('success!!',response);
            })
            .catch((error) => {
              Just.dismissLoading();
              log('error!!',error);
            })
        }} />
        <Button title="other page" style={styles.marginTop} onPress={this.props.handleNextPagePress} />
        {this.state.imageData !== '' ? <Image resizeMode="contain" source={{ uri: `data:image/png;base64,${this.state.imageData}` }} style={styles.imageData} /> : null}
        <Button title="Open Camera" style={styles.marginTop} onPress={() => {
          Just.openCamera({
            quality: 0.1,
          })
            .then((image: string) => {
              this.setState({ imageData: image });
              log(image.length);
            })
            .catch((error: Error) => {
              log(error);
            });
        }} />
        <Button title="发送本地通知" style={styles.marginTop} onPress={() => {
          Just.sendLocalNotification('本地通知测试', '别磨蹭了 ~ ~', 1);
        }} />
        <Button title="延迟发送本地通知" style={styles.marginTop} onPress={() => {
          Just.sendLocalNotificationAfter(3, '本地通知测试', '别磨蹭了 ~ ~', 1);
        }} />
        <Button title="弹框 success" style={styles.marginTop} onPress={() => {
          Just.showSuccess('成功了 ~ ~', () => {
            log('================');
          }, () => {
            log('======= DialogManager dismiss =======');
          });
        }} />
        <Button title="弹框 failure" style={styles.marginTop} onPress={() => {
          Just.showFailure('失败了 ~ ~');
        }} />
        <Button title="弹框 warning" style={styles.marginTop} onPress={() => {
          Just.showMessage('注意 ~ ~', () => {
            log('================');
          });
        }} />
        <Button title="开启轮询 0" style={styles.marginTop} onPress={() => {
          // Just.startPolling('polling_00', 3);//ios
          Just.startPolling('PollingService',5);
        }} />
        <Button title="开启轮询 1" style={styles.marginTop} onPress={() => {
          Just.startPolling('polling_01', 3);
        }} />
        <Button title="停止轮询 0" style={styles.marginTop} onPress={() => {
          Just.stopPolling('PollingService');
        }} />
        <Button title="停止轮询 1" style={styles.marginTop} onPress={() => {
          Just.stopPolling('polling_01');
        }} />
        <Button title="缓存图片" style={styles.marginTop} onPress={() => {
          Just.cacheImage('http://127.0.0.1:8000/jjm.jpg');
        }} />
        <Button title="获取缓存图片" style={styles.marginTop} onPress={() => {
          Just.imageFromCache('http://127.0.0.1:8000/jjm.jpg')
            .then((image: any) => {
              log(image);
            })
            .catch((error: Error) => {
              log(error);
            });
        }} />
        <Button title="当前缓存大小" style={styles.marginTop} onPress={() => {
          Just.currentDiskCacheSize()
            .then((result: any) => {
              log(result);
            });
        }} />
        <Button title="清除缓存图片" style={styles.marginTop} onPress={() => {
          Just.clearCache();
        }} />
        <Button title="Add" style={styles.marginTop} onPress={() => {
          Just.add({ id: '12345', data: { name: 'zhangsan', age: 15, dog: { name: 'wangcai', age: 3 } }})
            .then((response) => {
              log(response);
            })
            .catch((error) => {
              log(error);
            });
        }} />
        <Button title="Query All" style={styles.marginTop} onPress={async () => {
          Just.queryAll()
            .then((response) => {
              log(response);
            })
            .catch((error) => {
              log(error);
            });
        }} />
        <Button title="Query" style={styles.marginTop} onPress={async () => {
          Just.query({ id: '12345' })
            .then((response) => {
              log(response);
            })
            .catch((error) => {
              log(error);
            });
        }} />
        <Button title="Update" style={styles.marginTop} onPress={async () => {
          Just.update({ id: '12345' }, { id: '12345', data: { name: 'lisi', age: 15, dog: { name: 'wangwanghaha', age: 3 } }})
            .then((response) => {
              log(response);
            })
            .catch((error) => {
              log(error);
            });
        }} />
        <Button title="Delete" style={styles.marginTop} onPress={async () => {
          Just.delete({ id: '12345' });
        }} />
        <Button title="Delete All" style={styles.marginTop} onPress={async () => {
          Just.deleteAll();
        }} />
        <Button title="picker选择器" style={styles.marginTop} onPress={() => {

            Just.initPicker({
                confirmButtonColor: [17,119,219, 1],
                cancelButtonColor: [17,119,219, 1],
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                titleText: 'title',
                data: ['aaa','bbb','ccc','ddd'],
                selectedValue: [],
                onPickerConfirm: ()=>{},
                onPickerCancel: ()=>{},
            });
            Just.showPicker();


          // Just.showPicker('地址选择器',['111','222','333','444','555'],(message: string, index: any)=>{
          //   log(message,index);
          //   });
        }} />
        <Button title="picker时间选择器" style={styles.marginTop} onPress={() => {
          Just.showDatePicker('时间选择器',(message: string) => {
            log(message);
            });
        }} />

        <DatePicker
            style={styles.datePickerLayout}
            showIcon={false}
            date={this.props.value}
            mode='date'
            placeholder='请选择'
            format='YYYY-MM-DD'
            confirmBtnText='确定'
            cancelBtnText='取消'
            disabled={this.props.disabled}
            customStyles={{
                dateInput: {
                    height: Constant.editLayoutHeight,
                    alignItems: 'flex-start',
                    paddingLeft: 15,
                    borderColor: 'gray',
                    borderRadius: 10,
                    borderWidth: 1,
                },
                dateText: {
                    fontSize: Constant.fontSize,
                },
                disabled: {
                    backgroundColor: Color.disabledBackgroundColor
                }
            }}
            onDateChange={(date) => {
                this.props.onDateChange(date);
            }}
        />
      </ScrollView>
    );
  }

}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  imageData: {
    marginTop: 20,
    marginLeft: 20,
    marginRight: 20,
    height: 150
  },
  testResult: {
    marginTop: 20,
    fontSize: 20,
    alignSelf: 'center'
  },
  marginTop_50: {
    marginTop: 50,
  },
  marginTop: {
    marginTop: 20,
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
});
