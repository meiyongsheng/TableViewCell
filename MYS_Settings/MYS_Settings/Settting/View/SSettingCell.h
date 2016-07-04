//
//  SSettingCell.h
//  01-S
//
//  Created by apple on 13-12-23.
//  Copyright (c) 2013年 S. All rights reserved.
//

#define KScreenWidth  [UIScreen mainScreen].bounds.size.width
#define KScreenHeight [UIScreen mainScreen].bounds.size.height




#import <UIKit/UIKit.h>

typedef void(^SwitchCallBack) (BOOL isSwitchON);

typedef void(^BtnCallBack) (NSInteger index);

typedef void(^BtnTimeBlock) (NSInteger index);


@class SSettingItem;
@interface SSettingCell : UITableViewCell

@property (nonatomic, strong) SSettingItem *item;


+ (id)settingCellWithTableView:(UITableView *)tableView cellType:(UITableViewCellStyle)type;
@property (nonatomic,weak) UITableViewController *superVC;



//-(void)getSwitchONCallBack:(SwitchCallBack)switchCallBack;

@property (nonatomic, copy) SwitchCallBack switchblock;

@property (nonatomic, copy) BtnCallBack btnCallBack;

@property (nonatomic, copy) BtnTimeBlock btnTimeBlock;


@end
