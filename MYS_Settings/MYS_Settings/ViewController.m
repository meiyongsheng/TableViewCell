//
//  ViewController.m
//  MYS_Settings
//
//  Created by wh15113030 on 16/7/4.
//  Copyright © 2016年 wh15113030. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)reledate{
    [self.tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"我";
    
    [self reloadDate:YES];
    
}

#pragma mark 加载数据
- (void)reloadDate:(BOOL)isOK
{
    //第一组
    [self add0SectionItemsWithAdd:isOK];
    
    //第二组
    [self add1SectionItemsWithAdd:isOK];
    
}

#pragma mark 添加第0组的模型数据
- (void)add0SectionItemsWithAdd:(BOOL)add
{
    
    SSettingItem *raidersItem = [SSettingItem itemWithImage:@"icon_7_2" textLabel:@"默认格式" textLabelColor:[UIColor redColor] detailTextLabel:@"Default" detailTextLabelColor:[UIColor redColor] type:STUITableViewCellStyleDefault rowHeight:60 isArrow:YES];
    
    
     SSettingItem *raidersItem1 = [SSettingItem itemWithImage:@"icon_7_2" textLabel:@"默认格式" textLabelColor:[UIColor redColor] detailTextLabel:@"Subtitle" detailTextLabelColor:[UIColor redColor] type:STUITableViewCellStyleSubtitle rowHeight:70 isArrow:YES];
    
     SSettingItem *raidersItem2 = [SSettingItem itemWithImage:@"icon_7_2" textLabel:@"默认格式-----" textLabelColor:[UIColor redColor] detailTextLabel:@"Value1------" detailTextLabelColor:[UIColor redColor] type:STUITableViewCellStyleValue1 rowHeight:80 isArrow:YES];
    
     SSettingItem *raidersItem3 = [SSettingItem itemWithImage:@"icon_7_2" textLabel:@"默认格式" textLabelColor:[UIColor redColor] detailTextLabel:@"Value2" detailTextLabelColor:[UIColor redColor] type:STUITableViewCellStyleValue2 rowHeight:90 isArrow:YES];
    
    SSettingGroup *group = [[SSettingGroup alloc] init];
    group.footerHeight = 0.000001;
    group.headerHeight = 0.00000001;
    group.items = @[raidersItem,raidersItem1,raidersItem2,raidersItem3];
    
    if (add) {
        [self.allGroups  addObject:group];
    } else {
        [self.allGroups replaceObjectAtIndex:0 withObject:group];
    }
}

#pragma mark 添加第1组的模型数据
- (void)add1SectionItemsWithAdd:(BOOL)add
{
    
    
    SSettingItem *raidersItem = [SSettingItem itemWithImage:@"icon_7_2" textLabel:@"开关" textLabelColor:[UIColor redColor]  swicth:NO type:SSettingItemTypeSwitch rowHeight:44];
    
    
    SSettingItem *raidersItem1 = [SSettingItem itemWithTextLabel:@"单行文本" placeholder:@"占位文字" type:SSettingItemTypeTextField rowHeight:44];
    
  
    SSettingGroup *group = [[SSettingGroup alloc] init];
    group.footerHeight = 10;
    group.headerHeight = 10;
    group.rowHeight = 60;
    group.items = @[raidersItem,raidersItem1];
    
    if (add) {
        [self.allGroups  addObject:group];
    } else {
        [self.allGroups replaceObjectAtIndex:0 withObject:group];
    }
}

@end
