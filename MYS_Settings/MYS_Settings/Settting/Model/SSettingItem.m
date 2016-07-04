//
//  SSettingItem.m
//  01-S
//
//  Created by apple on 13-12-23.
//  Copyright (c) 2013年 S. All rights reserved.
//

#define FONT(font)  [UIFont systemFontOfSize:font]

#import "SSettingItem.h"

@implementation SSettingItem

/**
 *  初始化Cell
 *
 *  @param icon  imageView
 *  @param title textLabel.text
 *  @param color textLabel文字的颜色
 *  @param title detailTextLabel.text
 *  @param color detailTextLabel 文字的颜色
 *  @param type  cell的类型
 *
 *  @return cell的属性
 */
+ (id)itemWithImage:(NSString *)iconName textLabel:(NSString *)title textLabelColor:(UIColor *)color detailTextLabel:(NSString *)dTtitle detailTextLabelColor:(UIColor *)dTcolor type:(SSettingItemType)type rowHeight:(CGFloat)rowHeight isArrow:(BOOL)isArrow{
    
    SSettingItem *item = [[self alloc] init];
    
    item.iconName = iconName;
    item.textLabelText = title;
    item.textLabelColor = color;
    item.detailTextLabelText = dTtitle;
    item.detailTextLabelColor = dTcolor;
    item.type = type;
    item.isArrow = isArrow;
    item.rowHeight = rowHeight;
    
    return item;
    
}


+ (id)itemWithImage:(NSString *)iconName textLabel:(NSString *)title textLabelColor:(UIColor *)color swicth:(BOOL)isSwitchON type:(SSettingItemType)type rowHeight:(CGFloat)rowHeight{
    
    SSettingItem *item = [[self alloc] init];
    item.iconName = iconName;
    item.textLabelText = title;
    item.textLabelColor = color;
    item.type = type;
    item.isSwitchON = isSwitchON;
    item.rowHeight = rowHeight;
    
    return item;
}


+ (id)itemWithTextLabel:(NSString *)text placeholder:(NSString *)placeholder type:(SSettingItemType)type rowHeight:(CGFloat)rowHeight{
    
    SSettingItem *item = [[self alloc] init];
    item.text = text;
    item.placeHolder = placeholder;
    item.type = type;
    item.rowHeight = rowHeight;
    
    return item;

}


@end
