package com.jjmproject.utilities;

import com.jjmproject.constants.Constant;
import com.jjmproject.vendors.log.OrhanobutLogger;
import com.orhanobut.logger.Logger;

/**
 * package: com.jjmproject.utilities
 * author: ivokc
 * email: jijm@bosc.cn
 * github: https://github.com/ivokc
 * date: 2018/1/11
 * desc:
 */

public class LogUtility {

    public static void init(){
        OrhanobutLogger.init(Constant.IS_DEBUG);
    }

    /*OrhanobutLogger start*/
    public static void d(String message, Object... args) {
        Logger.d(message, args);
    }

    public static void d(Object object) {
        Logger.d(object);
    }

    public static void e(String message, Object... args) {
        Logger.e(null, message, args);
    }

    public static void e(Throwable throwable, String message, Object... args) {
        Logger.e(throwable, message, args);
    }

    public static void i(String message, Object... args) {
        Logger.i(message, args);
    }

    public static void v(String message, Object... args) {
        Logger.v(message, args);
    }

    public static void w(String message, Object... args) {
        Logger.w(message, args);
    }

    public static void wtf(String message, Object... args) {
        Logger.wtf(message, args);
    }


    /**
     * Formats the json content and print it
     *
     * @param json the json content
     */
    public static void json(String json) {
        Logger.json(json);
    }

    /**
     * Formats the json content and print it
     *
     * @param xml the xml content
     */
    public static void xml(String xml) {
        Logger.xml(xml);
    }
    /*OrhanobutLogger end*/


}
