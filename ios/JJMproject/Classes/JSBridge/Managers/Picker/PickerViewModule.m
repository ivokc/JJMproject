//
//  PickerViewModule.m
//  PickerViewModule
//
//  Created by MFHJ-DZ-001-417 on 16/9/6.
//  Copyright © 2016年 MFHJ-DZ-001-417. All rights reserved.
//

#import "PickerViewModule.h"
#import "BzwPicker.h"
#import <React/RCTEventDispatcher.h>

@interface PickerViewModule()

@property(nonatomic,strong)BzwPicker *pick;
@property(nonatomic,strong)UIView *mask;
@property(nonatomic,assign)float height;
@property(nonatomic,weak)UIWindow * window;

@end

@implementation PickerViewModule

@synthesize bridge = _bridge;

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

+ (BOOL)requiresMainQueueSetup
{
    return YES;
}

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(initPicker:(NSDictionary *)indic) {

    dispatch_async(dispatch_get_main_queue(), ^{
        [[UIApplication sharedApplication].keyWindow endEditing:YES];
    });

    self.window = [UIApplication sharedApplication].keyWindow;

    NSString *pickerConfirmBtnText = indic[@"confirmButtonText"];
    NSString *pickerCancelBtnText = indic[@"cancelButtonText"];
    NSString *pickerTitleText = indic[@"titleText"];
    NSArray *pickerConfirmBtnColor = indic[@"confirmButtonColor"];
    NSArray *pickerCancelBtnColor = indic[@"cancelButtonColor"];
    NSArray *pickerTitleColor = indic[@"titleColor"];
    NSArray *pickerToolBarBg = indic[@"toolBarBackground"];
    NSArray *pickerBg = indic[@"background"];
    NSArray *selectArry = indic[@"selectedValue"];
    NSArray *weightArry = indic[@"wheelFlex"];
    NSString *pickerToolBarFontSize = [NSString stringWithFormat:@"%@", indic[@"toolBarFontSize"]];
    NSString *pickerFontSize = [NSString stringWithFormat:@"%@", indic[@"fontSize"]];
    NSArray *pickerFontColor = indic[@"fontColor"];
    NSString *pickerRowHeight = indic[@"rowHeight"];
    id pickerData = indic[@"data"];

    NSMutableDictionary *dataDic = [[NSMutableDictionary alloc] init];

    dataDic[@"pickerData"] = pickerData;

    [self.window.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[BzwPicker class]]) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [obj removeFromSuperview];
            });
        }
    }];

    if ([[UIDevice currentDevice].systemVersion doubleValue] >= 9.0) {
        self.height = 250;
    } else {
        self.height = 220;
    }
    
    self.pick = [[BzwPicker alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, self.height) dic:dataDic leftStr:pickerCancelBtnText centerStr:pickerTitleText rightStr:pickerConfirmBtnText topbgColor:pickerToolBarBg bottombgColor:pickerBg leftbtnbgColor:pickerCancelBtnColor rightbtnbgColor:pickerConfirmBtnColor centerbtnColor:pickerTitleColor selectValueArry:selectArry weightArry:weightArry pickerToolBarFontSize:pickerToolBarFontSize pickerFontSize:pickerFontSize pickerFontColor:pickerFontColor  pickerRowHeight: pickerRowHeight];
  
    self.mask = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _mask.backgroundColor = [[UIColor alloc] initWithRed:0 green:0 blue:0 alpha:0];
    
    _pick.bolock = ^(NSDictionary *backinfoArry) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (_pick && ![backinfoArry[@"type"] isEqualToString:@"select"]) {
                dispatch_async(dispatch_get_main_queue(), ^{
                  [UIView animateWithDuration:.3 animations:^{
                    _mask.backgroundColor = [[UIColor alloc] initWithRed:0 green:0 blue:0 alpha:0];
                    [_pick setFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, self.height)];
                  } completion:^(BOOL finished) {
                    [_mask removeFromSuperview];
                  }];
                });
            }
            [_bridge.eventDispatcher sendAppEventWithName:@"pickerEvent" body:backinfoArry];
        });
    };

    dispatch_async(dispatch_get_main_queue(), ^{
        [_mask addSubview:_pick];
        [self.window addSubview:_mask];
    });

}

RCT_EXPORT_METHOD(show) {
    if (self.pick) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:.3 animations:^{
                _mask.backgroundColor = [[UIColor alloc] initWithRed:0 green:0 blue:0 alpha:.5];
                [_pick setFrame:CGRectMake(0, SCREEN_HEIGHT-self.height, SCREEN_WIDTH, self.height)];
            }];
        });
    }
    return;
}

RCT_EXPORT_METHOD(hide) {
    if (self.pick) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:.3 animations:^{
                _mask.backgroundColor = [[UIColor alloc] initWithRed:0 green:0 blue:0 alpha:0];
                [_pick setFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, self.height)];
            } completion:^(BOOL finished) {
              [_mask removeFromSuperview];
            }];
        });
    }
    return;
}

RCT_EXPORT_METHOD(select: (NSArray*)data){
    if (self.pick) {
        dispatch_async(dispatch_get_main_queue(), ^{
            _pick.selectValueArry = data;
            [_pick selectRow];
        });
    }
    return;
}

RCT_EXPORT_METHOD(isPickerShow:(RCTResponseSenderBlock)getBack){
    if (self.pick) {
        CGFloat pickY = _pick.frame.origin.y;
        if (pickY == SCREEN_HEIGHT) {
            getBack(@[@YES]);
        } else {
            getBack(@[@NO]);
        }
    } else {
        getBack(@[@"picker不存在"]);
    }
}

@end
