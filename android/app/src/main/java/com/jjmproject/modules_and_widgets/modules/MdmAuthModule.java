package com.jjmproject.modules_and_widgets.modules;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.jjmproject.utilities.LogUtility;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * package: com.jjmproject.modules_and_widgets.modules
 * author: ivokc
 * email: jijm@bosc.cn
 * github: https://github.com/ivokc
 * date: 2018/1/29
 * desc: MDM统一认证模块
 */

public class MdmAuthModule extends ReactContextBaseJavaModule {

    private static final String TAG = "MdmAuthModule";

    public MdmAuthModule(ReactApplicationContext reactContext) {
        super(reactContext);
    }

    @Override
    public String getName() {
        return "MdmAuthModule";
    }



    @ReactMethod
    public void getSSOToken(Promise promise){
        try {
            Class loginAgentClazz = Class.forName("com.huawei.anyoffice.sdk.login.LoginAgent");
            Method getInstanceMethod = loginAgentClazz.getDeclaredMethod("getInstance");
            Method getUserInfoMethod = loginAgentClazz.getDeclaredMethod("getUserInfo");
            Object loginAgentInstance = getInstanceMethod.invoke(loginAgentClazz);
            Object userInfo = getUserInfoMethod.invoke(loginAgentInstance);
            Class userInfoClazz = Class.forName("com.huawei.anyoffice.sdk.login.LoginParam$UserInfo");
            Field detailUserInfoField = userInfoClazz.getField("detailUserInfos");
            Object detailUserInfo = detailUserInfoField.get(userInfo);
            Class detailUserInfoClazz = Class.forName("com.huawei.anyoffice.sdk.login.LoginParam$DetailUserInfo");
            Field ssiAuthField = detailUserInfoClazz.getField("ssiAuth");
            String ssiAuth = (String)ssiAuthField.get(detailUserInfo);
            LogUtility.e(TAG, "reflect to get ssiauth: " + ssiAuth);
            promise.resolve(ssiAuth);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            promise.reject(e.toString());
        }catch (NoSuchMethodException e) {
            e.printStackTrace();
            promise.reject(e.toString());
        }catch (IllegalAccessException e) {
            e.printStackTrace();
            promise.reject(e.toString());
        }catch (InvocationTargetException e) {
            e.printStackTrace();
            promise.reject(e.toString());
        }catch (NoSuchFieldException e) {
            e.printStackTrace();
            promise.reject(e.toString());
        }
    }

    @ReactMethod
    public void getUserName(Promise promise){
        try {
            Class loginAgentClazz = Class.forName("com.huawei.anyoffice.sdk.login.LoginAgent");
            Method getInstanceMethod = loginAgentClazz.getDeclaredMethod("getInstance");
            Method getUserInfoMethod = loginAgentClazz.getDeclaredMethod("getUserInfo");
            Object loginAgentInstance = getInstanceMethod.invoke(loginAgentClazz);
            Object userInfo = getUserInfoMethod.invoke(loginAgentInstance);
            Class userInfoClazz = Class.forName("com.huawei.anyoffice.sdk.login.LoginParam$UserInfo");
            Field userNameField = userInfoClazz.getField("userName");
            String userName = (String)userNameField.get(userInfo);
            promise.resolve(userName);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            promise.reject(e.toString());
        }catch (NoSuchMethodException e) {
            e.printStackTrace();
            promise.reject(e.toString());
        }catch (IllegalAccessException e) {
            e.printStackTrace();
            promise.reject(e.toString());
        } catch (InvocationTargetException e) {
            e.printStackTrace();
            promise.reject(e.toString());
        }
        catch (NoSuchFieldException e) {
            e.printStackTrace();
            promise.reject(e.toString());
        }
    }

}
