package com.jjmproject.utilities;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.telephony.TelephonyManager;

import com.android.volley.DefaultRetryPolicy;

import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonObjectRequest;
import com.jjmproject.constants.Constant;
import com.jjmproject.vendors.http.VolleySingleton;
import com.jjmproject.vendors.log.OrhanobutLogger;
import com.squareup.phrase.Phrase;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.Serializable;
import java.net.Inet6Address;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.util.Enumeration;

/**
 * package: com.jjmproject.utilities
 * author: ivokc
 * email: jijm@bosc.cn
 * github: https://github.com/ivokc
 * date: 2017/12/18
 * desc:
 */

public class NetworkUtility {

    private static Context mContext;
    private static VolleySingleton mVolleySingleton;





    public static void init(Context Context){

        mContext = Context;
        mVolleySingleton = VolleySingleton.getInstance(Context);

    }

    //请求成功回调接口
    public interface NetworkSuccessCallback extends Serializable {
        public void onSuccess(String responseString);
    }

    //请求失败回调接口
    public interface NetworkFailureCallback extends Serializable {
        public void onFailure(VolleyError error);
    }





    public static void sendRequest(String url, String paramsString ,NetworkSuccessCallback successCallback,NetworkFailureCallback failureCallback){
        try {
            JSONObject params = new JSONObject(paramsString);
            LogUtility.d(Phrase.from("=== {url} ====>>>>> {params}").put("url", url).put("params", paramsString).format().toString());
            mVolleySingleton.addToRequestQueue(new JsonObjectRequest(url, "{}".equals(paramsString) ? null : params,
                response ->  {
                    // 组装成功返回数据
                    LogUtility.d(Phrase.from("=== success === url ====>>>>> {url}").put("url", url).format().toString());
                    LogUtility.json(Phrase.from("{response}").put("response", response.toString()).format().toString());
                    successCallback.onSuccess(response.toString());
                }, error -> {
                    failureCallback.onFailure(error);
                }
            ).setRetryPolicy(new DefaultRetryPolicy(Constant.DEFAULT_NETWORK_TIMEOUT,Constant.MAX_NUM_RETRIES,1.0f)));
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }







    /**
     * 获取 Mac 地址
     */
    public static String fetchMacAddress() {
        WifiManager wifi = (WifiManager) mContext.getSystemService(Context.WIFI_SERVICE);
        WifiInfo info = wifi.getConnectionInfo();
        return info.getMacAddress();
    }

    /**
     * 获取 IP 地址
     */
    public static String fetchIPAddress() {
        String hostIp = null;
        try {
            Enumeration nis = NetworkInterface.getNetworkInterfaces();
            InetAddress ia;
            while (nis.hasMoreElements()) {
                NetworkInterface ni = (NetworkInterface) nis.nextElement();
                Enumeration<InetAddress> ias = ni.getInetAddresses();
                while (ias.hasMoreElements()) {
                    ia = ias.nextElement();
                    if (ia instanceof Inet6Address) {
                        continue;// skip ipv6
                    }
                    String ip = ia.getHostAddress();
                    if (!"127.0.0.1".equals(ip)) {
                        hostIp = ia.getHostAddress();
                        break;
                    }
                }
            }
        } catch (SocketException e) {
            e.printStackTrace();
        }
        return hostIp;
    }

    public static boolean isWifi() {
        ConnectivityManager cm = (ConnectivityManager) mContext.getSystemService(Context.CONNECTIVITY_SERVICE);
        NetworkInfo networkINfo = cm.getActiveNetworkInfo();
        return networkINfo != null && networkINfo.getType() == ConnectivityManager.TYPE_WIFI;
    }

    public static boolean is3G() {
        ConnectivityManager cm = (ConnectivityManager) mContext.getSystemService(Context.CONNECTIVITY_SERVICE);
        NetworkInfo networkINfo = cm.getActiveNetworkInfo();
        return networkINfo != null && networkINfo.getType() == ConnectivityManager.TYPE_MOBILE;
    }



    public static boolean isNetworkConnected() {
        if (mContext != null) {
            ConnectivityManager mConnectivityManager = (ConnectivityManager) mContext.getSystemService(Context.CONNECTIVITY_SERVICE);
            NetworkInfo mNetworkInfo = mConnectivityManager.getActiveNetworkInfo();
            if (mNetworkInfo != null) {
                return mNetworkInfo.isAvailable();
            }
        }
        return false;
    }

    public static boolean isWifiEnabled() {
        ConnectivityManager connectivityManager = (ConnectivityManager) mContext.getSystemService(Context.CONNECTIVITY_SERVICE);
        TelephonyManager telephonyManager = (TelephonyManager) mContext.getSystemService(Context.TELEPHONY_SERVICE);
        return ((connectivityManager.getActiveNetworkInfo() != null
                && connectivityManager.getActiveNetworkInfo().getState() == NetworkInfo.State.CONNECTED)
                || telephonyManager.getNetworkType() == TelephonyManager.NETWORK_TYPE_UMTS);
    }



}
