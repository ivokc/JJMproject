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

    public static final boolean IS_DEBUG = true;

    /* 拍照存储路径 */
    public static final String PHOTO_FILE_PATH = Environment.getExternalStorageDirectory().getPath() + "/JJMproject/photos/";
    /* 图片质量 */
    public static final int PHOTO_QUALITY = 10;

    /* 相机 request code */
    public static int CAMERA_REQUEST_CODE = 123;



    /* 日志文件名称格式 */
    public static final SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    public static final SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");



}
