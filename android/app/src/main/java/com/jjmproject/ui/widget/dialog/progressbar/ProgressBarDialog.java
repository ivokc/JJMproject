package com.jjmproject.ui.widget.dialog.progressbar;

import android.app.Dialog;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.jjmproject.R;

/**
 * package: com.jjmproject.ui.widget.dialog.progressbar
 * author: ivokc
 * email: jijm@bosc.cn
 * github: https://github.com/ivokc
 * date: 2018/1/12
 * desc:
 */

public class ProgressBarDialog extends Dialog {

    public ProgressBarDialog(Context context) {
        super(context);
    }

    public ProgressBarDialog(Context context, int theme) {
        super(context, theme);
    }

    public ProgressBarDialog setMessage(String message) {
        TextView textView = (TextView)this.findViewById(R.id.dialog_loading_message);
        if (!"".equals(message) && message != null) {
            textView.setText(message);
            textView.setVisibility(View.VISIBLE);
        } else {
            textView.setVisibility(View.GONE);
        }
        return this;
    }

    public ProgressBarDialog setCouldCancelable(boolean couldCancelable) {
        this.setCancelable(couldCancelable);
        return this;
    }

    public static class Builder {

        private Context context;

        public Builder(Context context) {
            this.context = context;
        }

        public ProgressBarDialog build() {
            LayoutInflater inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
            final ProgressBarDialog dialog = new ProgressBarDialog(context, R.style.Dialog);
            View layout = inflater.inflate(R.layout.dialog_loading_view, null, false);

            dialog.addContentView(layout, new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            dialog.setContentView(layout);
            return dialog;
        }
    }



}
