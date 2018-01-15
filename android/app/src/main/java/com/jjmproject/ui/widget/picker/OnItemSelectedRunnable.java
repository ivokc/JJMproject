package com.jjmproject.ui.widget.picker;

/**
 * package: com.framework.initialize
 * author: MeePwn
 * email: maybewaityou@gmail.com
 * github: https://github.com/maybewaityou
 * date: 2017/2/9 上午11:29
 * desc:
 */

final class OnItemSelectedRunnable implements Runnable {

    final LoopView loopView;

    OnItemSelectedRunnable(LoopView loopview) {
        loopView = loopview;
    }

    @Override
    public final void run() {
        loopView.onItemSelectedListener.onItemSelected(loopView.getSelectedItem(),loopView.getSelectedIndex());
    }
}
