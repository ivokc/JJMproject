//
//  RNDatePickView.h
//  MarioFramework
//
//  Created by 罗晓锋 on 2017/12/28.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RNDatePickView : UIView

typedef void (^DatePickerBlock)(NSString *);

@property (nonatomic,strong) NSString *title;
@property (nonatomic, strong) NSArray* contentArray;
@property (nonatomic, copy) DatePickerBlock pickerBlock;

- (void)show;
- (void)dismiss;

@end
