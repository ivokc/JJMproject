//
//  RNDatePickView.m
//  MarioFramework
//
//  Created by 罗晓锋 on 2017/12/28.
//  Copyright © 2017年 Facebook. All rights reserved.
//
#define KColorAlpha(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define KRect(x, y, w, h)  CGRectMake([UIScreen mainScreen].bounds.size.width * x, [UIScreen mainScreen].bounds.size.height * y, [UIScreen mainScreen].bounds.size.width * w,  [UIScreen mainScreen].bounds.size.height * h)
#define KFont(f) [UIFont systemFontOfSize:[UIScreen mainScreen].bounds.size.width * f]

#import "RNDatePickView.h"

@interface RNDatePickView()

/** view */
@property (nonatomic,strong) UIView *topView;
/** button */
@property (nonatomic,strong) UIButton *doneBtn;
/** button */
@property (nonatomic,strong) UIButton *ranBtn;
/** datePicker */
@property (nonatomic,strong) UIDatePicker *datePicker;

@property (nonatomic, copy) NSString *selectedMessage;

@end

@implementation RNDatePickView

- (instancetype)initWithFrame:(CGRect)frame{
  self = [super initWithFrame:KRect(0, 0, 1, 917/667)];
  
  if (self)
  {
    self.backgroundColor = KColorAlpha(0, 0, 0, 0.4);
  }
  return self;
}

- (void) layoutSubviews{
  [super layoutSubviews];
  
  self.topView = [[UIView alloc]initWithFrame:KRect(0, 1, 1, 250/667)];
  self.topView.backgroundColor = [UIColor whiteColor];
  [self addSubview:self.topView];
  
  //为view上面的两个角做成圆角
  UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.topView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(10, 10)];
  CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
  maskLayer.frame = self.topView.bounds;
  maskLayer.path = maskPath.CGPath;
  self.topView.layer.mask = maskLayer;
  
  self.doneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
  [self.doneBtn setTitle:@"确定" forState:UIControlStateNormal];
  [self.doneBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
  [self.doneBtn setFrame:KRect(320/375, 5/667, 50/375, 40/667)];
  [self.doneBtn addTarget:self action:@selector(confirm) forControlEvents:UIControlEventTouchUpInside];
  [self.topView addSubview:self.doneBtn];
  
  self.ranBtn = [UIButton buttonWithType:UIButtonTypeCustom];
  [self.ranBtn setTitle:@"取消" forState:UIControlStateNormal];
  [self.ranBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
  [self.ranBtn setFrame:KRect(5/375, 5/667, 100/375, 40/667)];
  [self.ranBtn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
  [self.topView addSubview:self.ranBtn];
  
  UILabel *titlelb = [[UILabel alloc]initWithFrame:KRect(100/375, 0, 175/375, 50/667)];
  titlelb.backgroundColor = [UIColor clearColor];
  titlelb.textAlignment = NSTextAlignmentCenter;
  titlelb.text = self.title;
  titlelb.font = KFont(20/375);
  [self.topView addSubview:titlelb];
  
  self.datePicker = [[UIDatePicker alloc]initWithFrame:KRect(0, 50/667, 1, 200/667)];
  [_datePicker setDatePickerMode:UIDatePickerModeDate];
  [_datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];
  NSLocale *local = [[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"];
  [_datePicker setLocale:local];
  [self.topView addSubview:_datePicker];
}

- (void)dateChanged:(id)sender{
  UIDatePicker *control = (UIDatePicker *)sender;
  self.selectedMessage = [self changeDateMode:control.date];
}

- (NSString *)changeDateMode:(NSDate*)date{
  NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
  dateFormatter.dateFormat = @"YYYY/MM/dd";
  return [dateFormatter stringFromDate:date];
}

- (void)show{
  [UIView animateWithDuration:0.2 animations:^{
    self.alpha = 1;
    CGPoint point = self.center;
    point.y -= 250;
    self.center = point;
  } completion:^(BOOL finished) {
    
  }];
  [[UIApplication sharedApplication].keyWindow addSubview:self];
  [_datePicker setDate:[NSDate date] animated:YES];
  self.selectedMessage = [self changeDateMode:[NSDate date]];
}

- (void)dismiss{
  [UIView animateWithDuration:0.2 animations:^{
    self.alpha = 0;
    CGPoint point = self.center;
    point.y += 250;
    self.center = point;
  } completion:^(BOOL finished) {
    [self removeFromSuperview];
  }];
}

-(void)confirm
{
  self.pickerBlock(self.selectedMessage);
  [self dismiss];
}

- (void)dealloc{
  NSLog(@"datePickViewDealloc");
}

@end
