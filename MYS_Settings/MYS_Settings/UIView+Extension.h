//
//  UIView+Extension.h
//  Traveling
//
//  Created by apple on 14-10-7.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;


/**
 获取指定类型的父控件
 */
- (UIView *)parentViewWithType:(Class)viewType;

/**
 添加与view等宽的上方线条
 */
-(UIView*)addTopLineWithColor:(UIColor*)color andHeight:(CGFloat)height;

/**
 添加与view等宽的下方线条
 */
- (UIView*)addBottomLineWithColor:(UIColor*)color andHeight:(CGFloat)height;


@end
