package com.jjmproject.initialize;

import android.os.Bundle;

import com.facebook.react.ReactActivity;

/**
 * package: com.jjmproject.initialize
 * author: ivokc
 * email: jijm@bosc.cn
 * github: https://github.com/ivokc
 * date: 2017/12/14
 * desc:
 */

public interface UIinitialize extends Initialize {

    /**
     * 设置 activity 布局
     */
    public void setContentView();

    /**
     * 初始化数据
     */
    public void initData();

    /**
     * 初始化 View
     */
    public void initViews();

    /**
     * 设置 View 相关信息
     */
    public void setupViews();

}
