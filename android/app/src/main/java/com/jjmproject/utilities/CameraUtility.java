package com.jjmproject.utilities;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.provider.MediaStore;
import android.support.v4.content.FileProvider;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * package: com.jjmproject.utilities
 * author: ivokc
 * email: jijm@bosc.cn
 * github: https://github.com/ivokc
 * date: 2017/12/18
 * desc:
 */

public class CameraUtility {
    /* 图片路径 */
    public static String PHOTO_PATH = "";
    /* 图片质量 */
    public static int PHOTO_QUALITY = 10;

    public static void openCamera(Context context,int photoQuality, int requestCode) throws IOException {
        PHOTO_QUALITY = photoQuality;
//        new Thread(() -> {
            Intent takePictureIntent = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
            // Ensure that there's a camera activity to handle the intent
            if (takePictureIntent.resolveActivity(context.getPackageManager()) != null) {
                // 包名下缓存路径建图片
                File outputImage = new File(context.getExternalCacheDir(),"output_image.jpg");
                PHOTO_PATH = outputImage.getAbsolutePath();
                if (outputImage.exists()){
                    outputImage.delete();
                }
                outputImage.createNewFile();

                Uri photoURI;
                if (Build.VERSION.SDK_INT >= 24){
                    photoURI = FileProvider.getUriForFile(context,
                            "com.jjmproject.fileprovider",
                            outputImage);
                }else {
                    photoURI = Uri.fromFile(outputImage);
                }
                takePictureIntent.putExtra(MediaStore.EXTRA_OUTPUT, photoURI);
                ((Activity) context).startActivityForResult(takePictureIntent, requestCode);
            }

//        }).start();
    }


}
