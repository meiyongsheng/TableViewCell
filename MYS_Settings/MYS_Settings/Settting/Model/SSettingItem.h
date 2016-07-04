//
//  SSettingItem.h
//  01-S
//
//  Created by apple on 13-12-23.
//  Copyright (c) 2013年 S. All rights reserved.
//  一个Item对应一个Cell
// 用来描述当前cell里面显示的内容，描述点击cell后做什么事情

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SSettingItemType) {
    
    STUITableViewCellStyleDefault = 0, //有imageView和textLabel
    STUITableViewCellStyleSubtitle, //有imageView、textLabel、detailTextLabel(在左边)
    STUITableViewCellStyleValue1,//有imageView、textLabel、detailTextLabel(在右边)
    STUITableViewCellStyleValue2,//有imageView、textLabel、detailTextLabel(紧跟textLabel)

    SSettingItemTypeSwitch, // 开关
    SSettingItemTypeTextField, // 单行文本
    SSettingItemTypeTextView //文本框
};


@interface SSettingItem : NSObject
/** textLabel的描述文字*/
@property (nonatomic, copy) NSString *textLabelText;

/** textLabel的描述文字颜色*/
@property (nonatomic, copy) UIColor *textLabelColor;

/** detailTextLabelText的描述文字*/
@property (nonatomic, copy) NSString *detailTextLabelText;

/** detailTextLabelColor的描述文字颜色*/
@property (nonatomic, copy) UIColor *detailTextLabelColor;

/** 行高*/
@property (nonatomic, assign) CGFloat rowHeight;

/** 是否需要箭头*/
@property (nonatomic, assign) BOOL isArrow;

/** 开关的状态 */
@property (nonatomic, assign) BOOL isSwitchON;

/** textView.text */
@property (nonatomic, copy) NSString *text;
/** 占为文字 */
@property (nonatomic, copy) NSString *placeHolder;

/** 图片  */
@property (nonatomic, copy) NSString *iconName;

/** 描述文字颜色 */
@property (nonatomic , strong) UIColor *detailLabelColor;

/** 类型 */
@property (nonatomic, assign) SSettingItemType type;// Cell的样式

/** 点击Cell的操作 */
@property (nonatomic, copy) void (^operation)() ; // 点击cell后要执行的操作

//开关的状态
@property (nonatomic, copy) void (^SwitchON)(BOOL switchON);

//点击选择类型的block
@property (nonatomic, copy) void (^BtnCallBlock)(NSInteger index);

//点击时间的block
@property (nonatomic, copy) void (^BtnTimeBlock)(NSInteger index);



/**
 *  初始化Cell属性
 *
 *  @param icon   imageView的图片名称
 *  @param title textLabel.text
 *  @param color textLabel文字的颜色
 *  @param title detailTextLabel.text
 *  @param color detailTextLabel 文字的颜色
 *  @param type  cell的类型
 *  @param rowHeight 行高
 *  @param isArrow   是否需要箭头
 *
 *  @return cell的属性
 */
+ (id)itemWithImage:(NSString *)iconName textLabel:(NSString *)title textLabelColor:(UIColor *)color detailTextLabel:(NSString *)dTtitle detailTextLabelColor:(UIColor *)dTcolor type:(SSettingItemType)type rowHeight:(CGFloat)rowHeight isArrow:(BOOL)isArrow;

/**
 *  初始化Cell
 *
 *  @param iconName    imageView的图片名称
 *  @param title      textLabel.text
 *  @param color textLabel文字的颜
 *  @param color      textLabel文字的颜色
 *  @param isSwitchON 开关的状态
 *  @param type       Cell的类型
 *  @param rowHeight  行高
 *
 *  @return  cell的属性
 */
+ (id)itemWithImage:(NSString *)iconName textLabel:(NSString *)title textLabelColor:(UIColor *)color swicth:(BOOL)isSwitchON type:(SSettingItemType)type rowHeight:(CGFloat)rowHeight;

/**
 *   初始化Cell
 *
 *  @param text        textField的描述文字
 *  @param placeholder textField的占位文字
 *  @param type         Cell的类型
 *  @param rowHeight    行高
 *
 *  @return cell的属性
 */

+ (id)itemWithTextLabel:(NSString *)text placeholder:(NSString *)placeholder type:(SSettingItemType)type rowHeight:(CGFloat)rowHeight;

@end
