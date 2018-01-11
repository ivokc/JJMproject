package com.jjmproject.utilities;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.util.Base64;

import com.jjmproject.constants.Constant;
import com.jjmproject.vendors.log.OrhanobutLogger;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;


/**
 * package: com.jjmproject.util
 * author: ivokc
 * email: jijm@bosc.cn
 * github: https://github.com/ivokc
 * date: 2017/12/19
 * desc:
 */

public class DataUtility {


    /*日期时间start*/
    public final static String getCurrentTime() {
        return Constant.fmt.format(new Date());
    }

    public final static String getCurrentDate() {
        return Constant.format.format(new Date());
    }

    public final static String formatDate(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.format(date);
    }

    public final static String formatDateWithFormat(Date date, String format) {
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        return sdf.format(date);
    }

    public final static Date parse(String strDate) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.parse(strDate);
    }

    public final static Date parseWithFormat(String strDate, String format) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        return sdf.parse(strDate);
    }
    /*日期时间end*/
    /*图片数据start*/
    public final static String bitmapString(String photoPath) {
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

    public final static String bitmapToBase64(Bitmap bitmap) {

        String result = null;
        ByteArrayOutputStream baos = null;
        try {
            if (bitmap != null) {
                baos = new ByteArrayOutputStream();
                bitmap.compress(Bitmap.CompressFormat.JPEG, Constant.PHOTO_QUALITY, baos);

                baos.flush();
                baos.close();

                byte[] bitmapBytes = baos.toByteArray();
                LogUtility.d("==== bitmapBytes ====>>>>> " + bitmap.getByteCount());
                result = Base64.encodeToString(bitmapBytes, Base64.DEFAULT);
                LogUtility.d("==== bitmapString ====>>>>> " + result.length());

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

    public final static Bitmap base64ToBitmap(String base64Data) {
        byte[] bytes = Base64.decode(base64Data, Base64.DEFAULT);
        return BitmapFactory.decodeByteArray(bytes, 0, bytes.length);
    }
    /*图片数据end*/

    /*json数据start*/
    public final static Map<String, String> jsonToMap(String s) {
        Map<String, String> map = new HashMap<>();
        try {
            JSONObject json = new JSONObject(s);
            Iterator<String> keys = json.keys();
            while (keys.hasNext()) {
                String key = (String) keys.next();
                String value = json.get(key).toString();
                if (value.startsWith("{") && value.endsWith("}")) {
                    // map.put(key, (String)jsonToMap(value));
                } else {
                    map.put(key, value);
                }
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return map;
    }

    public final static List<Map<String, String>> jsonToList(String s) {
        List<Map<String, String>> list = new ArrayList<>();
        try {
            JSONArray jsonArray = new JSONArray(s);

            for (int i = 0; i < jsonArray.length(); i++) {
                JSONObject jsonObject = jsonArray.getJSONObject(i);
                list.add(jsonToMap(jsonObject.toString()));
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return list;
    }
    /*json数据end*/




}
