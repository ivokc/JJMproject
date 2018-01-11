package com.jjmproject.vendors.http;

import android.content.Context;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.toolbox.Volley;

/**
 * package: com.jjmproject.vendors.http
 * author: ivokc
 * email: jijm@bosc.cn
 * github: https://github.com/ivokc
 * date: 2018/1/8
 * desc: 单例模式保证整个应用生命周期一条requestQueue
 */

public class VolleySingleton {

    private static VolleySingleton mInstance;
    private RequestQueue mRequestQueue;
    private static Context mCtx;

    private VolleySingleton(Context context) {
        mCtx = context;

        mRequestQueue = getRequestQueue();
    }


    //同步块确保单例
    public static synchronized VolleySingleton getInstance(Context context) {
        if (mInstance == null) {
            mInstance = new VolleySingleton(context);
        }
        return mInstance;
    }

    public RequestQueue getRequestQueue() {
        if (mRequestQueue == null) {
            // getApplicationContext() is key, it keeps you from leaking the
            // Activity or BroadcastReceiver if someone passes one in.

//            mRequestQueue = Volley.newRequestQueue(mCtx.getApplicationContext());
            mRequestQueue = Volley.newRequestQueue(mCtx.getApplicationContext(),new OkHttpStack());//自定义okhttp实现
        }
        return mRequestQueue;
    }
    //添加请求到队列
    public <T> void addToRequestQueue(Request<T> req) {
        getRequestQueue().add(req);
    }
}
