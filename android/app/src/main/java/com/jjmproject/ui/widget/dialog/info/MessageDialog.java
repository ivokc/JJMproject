package com.jjmproject.ui.widget.dialog.info;

import android.app.Dialog;
import android.content.Context;
import android.support.annotation.NonNull;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;

import com.jjmproject.R;

/**
 * package: com.jjmproject.ui.widget.dialog.info
 * author: ivokc
 * email: jijm@bosc.cn
 * github: https://github.com/ivokc
 * date: 2018/1/14
 * desc:
 */

public class MessageDialog extends Dialog {
    public MessageDialog(Context context) {
        super(context);
    }

    public MessageDialog(Context context, int theme) {
        super(context, theme);
    }

    public MessageDialog setMessage(String message) {
        TextView messageTextView = (TextView) this.findViewById(R.id.dialog_message);
        if (!"".equals(message) && message != null) {
            messageTextView.setText(message);
            messageTextView.setVisibility(View.VISIBLE);
        } else {
            messageTextView.setVisibility(View.GONE);
        }
        return this;
    }

    public MessageDialog setupButtonsAttrs(String positiveTitle, String negativeTitle, View.OnClickListener positiveListener, View.OnClickListener negativeListener) {
        Button positiveButton = (Button) this.findViewById(R.id.positive_button);
        Button negativeButton = (Button) this.findViewById(R.id.negative_button);
        View block = this.findViewById(R.id.block);
        positiveButton.setText(positiveTitle);
        positiveButton.setOnClickListener(positiveListener);
        if (negativeListener == null) {
            block.setVisibility(View.GONE);
            negativeButton.setVisibility(View.GONE);
        } else {
            block.setVisibility(View.VISIBLE);
            negativeButton.setVisibility(View.VISIBLE);
            negativeButton.setText(negativeTitle);
            negativeButton.setOnClickListener(negativeListener);
        }
        return this;
    }

    public MessageDialog setCouldCancelable(boolean couldCancelable) {
        this.setCancelable(couldCancelable);
        return this;
    }

    public static class Builder {

        private Context context;

        public Builder(Context context) {
            this.context = context;
        }

        public MessageDialog build() {
            LayoutInflater inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
            final MessageDialog dialog = new MessageDialog(context, R.style.Dialog);
            View layout = inflater.inflate(R.layout.dialog_message_view, null, false);
            TextView titleTextView = (TextView) layout.findViewById(R.id.dialog_title);
            titleTextView.setText(R.string.dialog_message_title);

            dialog.addContentView(layout, new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            dialog.setContentView(layout);

            return dialog;
        }

    }


}
