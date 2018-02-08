//
//  RNPickView.m
//  NativeTest
//
//  Created by 罗晓锋 on 2017/12/21.
//  Copyright © 2017年 稀饭. All rights reserved.
//
#define KColorAlpha(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define KRect(x, y, w, h)  CGRectMake([UIScreen mainScreen].bounds.size.width * x, [UIScreen mainScreen].bounds.size.height * y, [UIScreen mainScreen].bounds.size.width * w,  [UIScreen mainScreen].bounds.size.height * h)
#define KFont(f) [UIFont systemFontOfSize:[UIScreen mainScreen].bounds.size.width * f]

#import "RNPickView.h"

@interface RNPickView()<UIPickerViewDelegate,UIPickerViewDataSource,UIScrollViewDelegate>

/** view */
@property (nonatomic,strong) UIView *topView;
/** button */
@property (nonatomic,strong) UIButton *doneBtn;
/** button */
@property (nonatomic,strong) UIButton *ranBtn;
/** pickerView */
@property (nonatomic,strong) UIPickerView *pickerView;

@property (nonatomic, assign) NSInteger selectedRow;
@property (nonatomic, copy) NSString *selectedMessage;

@end

@implementation RNPickView

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
  
  self.pickerView = [[UIPickerView alloc]init];
  [self.pickerView setFrame:KRect(0, 50/667, 1, 200/667)];
  [self.pickerView setBackgroundColor:[UIColor colorWithRed:240/255.0 green:239/255.0 blue:245/255.0 alpha:1]];
  [self.pickerView setDelegate:self];
  [self.pickerView setDataSource:self];
  
  [self.pickerView selectRow:0 inComponent:0 animated:YES];
  [self.topView addSubview:self.pickerView];
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
  [self.pickerView selectRow:0 inComponent:0 animated:YES];
  self.selectedMessage = self.contentArray[0];
  self.selectedRow = 0;
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
  self.pickerBlock(self.selectedMessage,self.selectedRow);
  [self dismiss];
}

// 返回多少列
- (NSInteger)numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView {
  return 1;
}
// 返回多少行
- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
  NSArray *items = self.contentArray;
  return items.count;
}
#pragma mark - 代理
// 返回第component列第row行的标题
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
  return self.contentArray[row];
}


// 选中行
- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
  self.selectedRow = row;
  self.selectedMessage = self.contentArray[row];
}

- (void)dealloc{
  NSLog(@"pickViewDealloc");
  _pickerView.delegate = nil;
  _pickerView.dataSource = nil;
}

@end

