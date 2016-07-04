//
//  UIView+Extension.m
//  Traveling
//
//  Created by apple on 14-10-7.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin
{
    return self.frame.origin;
}


/**
 获取指定类型的父控件
 */
- (UIView*)parentViewWithType:(Class)viewType
{
    UIView *parentView = self.superview;
    while ([parentView isKindOfClass:viewType]) {
        return parentView;
    }
    return  parentView==nil?nil:[parentView parentViewWithType:viewType];
}


- (UIView*)addTopLineWithColor:(UIColor *)color andHeight:(CGFloat)height
{
    UIView *topLine = [[UIView alloc]initWithFrame:CGRectMake(0, 0,self.width,height)];
    topLine.backgroundColor = color;
    topLine.alpha = 1;
    
    topLine.translatesAutoresizingMaskIntoConstraints=NO;
    
    [self addSubview:topLine];
    
    NSLayoutConstraint *topContraint=[NSLayoutConstraint
                                      constraintWithItem:topLine
                                      attribute:NSLayoutAttributeTop
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:self
                                      attribute:NSLayoutAttributeTop
                                      multiplier:1.0f
                                      constant:0.0];
    NSLayoutConstraint *widthContraint=[NSLayoutConstraint
                                        constraintWithItem:topLine
                                        attribute:NSLayoutAttributeWidth
                                        relatedBy:NSLayoutRelationEqual
                                        toItem:self
                                        attribute:NSLayoutAttributeWidth
                                        multiplier:1.0f
                                        constant:0.0];
    
    NSLayoutConstraint *heightContraint=[NSLayoutConstraint
                                         constraintWithItem:topLine
                                         attribute:NSLayoutAttributeHeight
                                         relatedBy:NSLayoutRelationEqual
                                         toItem:nil
                                         attribute:NSLayoutAttributeNotAnAttribute
                                         multiplier:1.0f
                                         constant:height];
    
    NSLayoutConstraint *leadingContraint=[NSLayoutConstraint
                                          constraintWithItem:topLine
                                          attribute:NSLayoutAttributeLeading
                                          relatedBy:NSLayoutRelationEqual
                                          toItem:self
                                          attribute:NSLayoutAttributeLeading
                                          multiplier:1.0f
                                          constant:0.0];
    
    [topLine addConstraint:heightContraint];
    //给button的父节点添加约束
    [self addConstraints:@[topContraint,widthContraint,leadingContraint]];
    
    return topLine;
    
}

- (UIView*)addBottomLineWithColor:(UIColor *)color andHeight:(CGFloat)height
{
    
    UIView *bottomLine = [[UIView alloc]initWithFrame:CGRectMake(0,self.height- height,self.width,height)];
    bottomLine.backgroundColor = color;
    bottomLine.alpha = 1;
    bottomLine.translatesAutoresizingMaskIntoConstraints=NO;
    [self addSubview:bottomLine];
    
    NSLayoutConstraint *bottomContraint=[NSLayoutConstraint
                                         constraintWithItem:bottomLine
                                         attribute:NSLayoutAttributeBottom
                                         relatedBy:NSLayoutRelationEqual
                                         toItem:self
                                         attribute:NSLayoutAttributeBottom
                                         multiplier:1.0f
                                         constant:0.0];
    NSLayoutConstraint *widthContraint=[NSLayoutConstraint
                                        constraintWithItem:bottomLine
                                        attribute:NSLayoutAttributeWidth
                                        relatedBy:NSLayoutRelationEqual
                                        toItem:self
                                        attribute:NSLayoutAttributeWidth
                                        multiplier:1.0f
                                        constant:0.0];
    
    NSLayoutConstraint *heightContraint=[NSLayoutConstraint
                                         constraintWithItem:bottomLine
                                         attribute:NSLayoutAttributeHeight
                                         relatedBy:NSLayoutRelationEqual
                                         toItem:nil
                                         attribute:NSLayoutAttributeNotAnAttribute
                                         multiplier:1.0f
                                         constant:height];
    
    NSLayoutConstraint *leadingContraint=[NSLayoutConstraint
                                          constraintWithItem:bottomLine
                                          attribute:NSLayoutAttributeLeading
                                          relatedBy:NSLayoutRelationEqual
                                          toItem:self
                                          attribute:NSLayoutAttributeLeading
                                          multiplier:1.0f
                                          constant:0.0];
    
    
    
    [bottomLine addConstraint:heightContraint];
    //给button的父节点添加约束
    [self addConstraints:@[bottomContraint,widthContraint,leadingContraint]];
    
    
    return bottomLine;
}

@end
