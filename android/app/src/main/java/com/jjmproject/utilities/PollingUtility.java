/**
 *
 * @FileName PollingUtility.java
 *
 */
package com.jjmproject.utilities;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.os.SystemClock;

import java.util.concurrent.TimeUnit;

/**
 * Class Name: PollingUtility.java
 *
 * Function: 轮询工具类
 *
 * Modifications:
 *
 * @author MeePwn
 * @version 1.0
 */
public class PollingUtility {

    /**
     * Function: 开启轮询服务
     *
     * @author MeePwn
     * @param context
     *            上下文
     * @param seconds
     *            轮询时间间隔 (android 5.1 为了省电, 对Alarm进行了优化, 如果seconds小于60s, 默认设为60s)
     * @param cls
     *            轮询服务
     * @param action
     */
    public static void startPollingService(Context context, int seconds, Class<?> cls, String action) {
        // 获取系统 AlarmManager 服务
        AlarmManager manager = (AlarmManager) context.getSystemService(Context.ALARM_SERVICE);

        // 包装要实现的Service的Intent
        Intent intent = new Intent(context, cls);
        intent.setAction(action);
        PendingIntent pendingIntent = PendingIntent.getService(context, 0, intent, PendingIntent.FLAG_UPDATE_CURRENT);
        // 触发服务的起始时间
        long triggerAtTime = SystemClock.elapsedRealtime();
        // 使用 AlarmManager 的 setRepeating 方法设置定期执行的时间间隔(seconds秒)和要执行的Service
        manager.setRepeating(AlarmManager.ELAPSED_REALTIME, triggerAtTime, TimeUnit.SECONDS.toMillis(seconds), pendingIntent);
    }

    /**
     * Function: 停止轮询服务
     *
     * @author MeePwn
     * @param context
     *            上下文
     * @param cls
     *            轮询服务
     * @param action
     */
    public static void stopPollingService(Context context, Class<?> cls, String action) {
        AlarmManager manager = (AlarmManager) context.getSystemService(Context.ALARM_SERVICE);

        Intent intent = new Intent(context, cls);
        intent.setAction(action);
        PendingIntent pendingIntent = PendingIntent.getService(context, 0, intent, PendingIntent.FLAG_UPDATE_CURRENT);

        // 取消正在执行的服务
        manager.cancel(pendingIntent);
    }
}
