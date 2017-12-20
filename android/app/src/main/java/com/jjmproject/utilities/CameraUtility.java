package com.jjmproject.utilities;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.provider.MediaStore;

import java.io.File;

import static com.jjmproject.constants.Constant.PHOTO_FILE_PATH;

/**
 * package: com.jjmproject.utilities
 * author: ivokc
 * email: jijm@bosc.cn
 * github: https://github.com/ivokc
 * date: 2017/12/18
 * desc:
 */

public class CameraUtility {

    public static String PHOTO_PATH = "";

    public static void openCamera(Context context, int requestCode) {
        new Thread(() -> {
            Intent intent = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
            File dir = new File(PHOTO_FILE_PATH);
            if (!dir.exists()) {
                dir.mkdirs();
            }
            String photoName = System.currentTimeMillis() + ".png";
            File file = new File(dir, photoName);
            intent.putExtra(MediaStore.EXTRA_OUTPUT, Uri.fromFile(file));
            PHOTO_PATH = PHOTO_FILE_PATH + photoName;
            ((Activity) context).startActivityForResult(intent, requestCode);
        }).start();
    }
}
