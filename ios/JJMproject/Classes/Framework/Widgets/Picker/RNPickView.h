//
//  RNPickView.h
//  MarioFramework
//
//  Created by 罗晓锋 on 2017/12/27.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RNPickView : UIView

typedef void (^PickerBlock)(NSString *,NSInteger);

@property (nonatomic,strong) NSString *title;
@property (nonatomic, strong) NSArray* contentArray;
@property (nonatomic, copy) PickerBlock pickerBlock;

- (void)show;
- (void)dismiss;

@end
