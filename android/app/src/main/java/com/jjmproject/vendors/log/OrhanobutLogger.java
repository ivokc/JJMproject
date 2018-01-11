package com.jjmproject.vendors.log;

import com.jjmproject.constants.Constant;
import com.orhanobut.logger.AndroidLogAdapter;
import com.orhanobut.logger.BuildConfig;
import com.orhanobut.logger.Logger;

/**
 * package: com.jjmproject.log
 * author: ivokc
 * email: jijm@bosc.cn
 * github: https://github.com/ivokc
 * date: 2017/12/18
 * desc:
 */

public class OrhanobutLogger {



    public static void init(boolean isDebug){
        com.orhanobut.logger.Logger.addLogAdapter(new AndroidLogAdapter(){
            @Override
            public boolean isLoggable(int priority, String tag) {
                return isDebug;
            }
        });
    }


}
