package com.jjmproject.constants;

import android.os.Environment;

import java.text.SimpleDateFormat;

/**
 * package: com.jjmproject.constants
 * author: ivokc
 * email: jijm@bosc.cn
 * github: https://github.com/ivokc
 * date: 2017/12/13
 * desc:
 */

public class Constant {

    public static final String appName = "JJMproject";
    public static final String packageName = "com." + appName.toLowerCase();

    /* 日志开关 */
    public static final boolean IS_DEBUG = true;
    /* 请求超时时间 */
    public static final int DEFAULT_NETWORK_TIMEOUT = 1000 * 60 * 2;
    /* 超时后, 重发次数 */
    public static int MAX_NUM_RETRIES = 0;



    /* 相机 request code */
    public static final int CAMERA_REQUEST_CODE = 123;



    /* 日志文件名称格式 */
    public static final SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    public static final SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

    /* 本地崩溃日志路径 */
    public static final String CRASH_REPORTER_PATH = Environment.getExternalStorageDirectory().getPath() + "/" + appName + "/";



}
