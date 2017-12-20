package com.jjmproject.util;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.util.Base64;

import com.jjmproject.constants.Constant;
import com.jjmproject.log.JLog;
import com.orhanobut.logger.Logger;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Date;


/**
 * package: com.jjmproject.util
 * author: ivokc
 * email: jijm@bosc.cn
 * github: https://github.com/ivokc
 * date: 2017/12/19
 * desc:
 */

public class DataUtil {

    public static String getCurrentTime() {
        return Constant.fmt.format(new Date());
    }

    public static String getCurrentDate() {
        return Constant.format.format(new Date());
    }


    public static String bitmapString(String photoPath) {
        String result = null;
        FileInputStream fis = null;
        try {
            fis = new FileInputStream(photoPath);
            Bitmap bitmap = BitmapFactory.decodeStream(fis);
            result = bitmapToBase64(bitmap);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } finally {
            try {
                assert fis != null;
                fis.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return result;
    }


    /**
     * bitmap转为base64
     *
     * @param bitmap
     * @return
     */
    public static String bitmapToBase64(Bitmap bitmap) {

        String result = null;
        ByteArrayOutputStream baos = null;
        try {
            if (bitmap != null) {
                baos = new ByteArrayOutputStream();
                bitmap.compress(Bitmap.CompressFormat.JPEG, Constant.PHOTO_QUALITY, baos);

                baos.flush();
                baos.close();

                byte[] bitmapBytes = baos.toByteArray();
                JLog.d("==== bitmapBytes ====>>>>> " + bitmap.getByteCount());
                result = Base64.encodeToString(bitmapBytes, Base64.DEFAULT);
                JLog.d("==== bitmapString ====>>>>> " + result.length());

            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (baos != null) {
                    baos.flush();
                    baos.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return result;
    }
    /**
     * base64转为bitmap
     *
     * @param base64Data
     * @return
     */
    public static Bitmap base64ToBitmap(String base64Data) {
        byte[] bytes = Base64.decode(base64Data, Base64.DEFAULT);
        return BitmapFactory.decodeByteArray(bytes, 0, bytes.length);
    }
}
