//
//  SBaseSettingViewController.m
//  01-S
//
//  Created by apple on 13-12-23.
//  Copyright (c) 2013年 S. All rights reserved.
//

#import "SBaseSettingViewController.h"
#import "SSettingCell.h"

@interface SBaseSettingViewController ()

@end

@implementation SBaseSettingViewController

- (void)reledate{
    [self.tableView reloadData];
}

- (NSMutableArray *)allGroups{
    if (_allGroups ==nil) {
        _allGroups = [NSMutableArray array];
    }
    return _allGroups;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//   self.allGroups = [NSMutableArray array];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.showsHorizontalScrollIndicator = NO;
    tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:tableView];
    
    self.tableView = tableView;
    
//    self.tableView.rowHeight = self.rowHeight;
    
//    self.view.backgroundColor = [UIColor colorWithRed:235 / 255.0 green:235 / 255.0 blue:235 / 255.0 alpha:235 / 255.0];
    
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.allGroups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    SSettingGroup *group = self.allGroups[section];
    return group.items.count;
}

#pragma mark 每当有一个cell进入视野范围内就会调用，返回当前这行显示的cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.创建一个SSettingCell
    SSettingGroup *group = self.allGroups[indexPath.section];
    SSettingItem *item = group.items[indexPath.row];
    
    SSettingCell *cell = [SSettingCell settingCellWithTableView:tableView cellType:(UITableViewCellStyle)item.type];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    SSettingCell *cell1 =  (SSettingCell *)cell;
    
    cell1.superVC =(UITableViewController *)self;
    // 2.取出这行对应的模型（SSettingItem）
    SSettingGroup *group = self.allGroups[indexPath.section];
    cell1.item = group.items[indexPath.row];
    
    __block SSettingCell *weakCell = cell1;
    
    cell1.btnCallBack = ^ (NSInteger index){
        if (weakCell.item.BtnCallBlock) {
            weakCell.item.BtnCallBlock(index);
        }
    };
    
    cell1.btnTimeBlock = ^ (NSInteger index){
        if (weakCell.item.BtnTimeBlock) {
            weakCell.item.BtnTimeBlock(index);
        }
    };
}



#pragma mark 点击了cell后的操作
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 0.取出这行对应的模型
    SSettingGroup *group = self.allGroups[indexPath.section];
    SSettingItem *item = group.items[indexPath.row];
    
    // 1.取出这行对应模型中的block代码
    if (item.operation) {
        // 执行block
        item.operation();
    }
    
//    if (item.SwitchON) {
//        item.SwitchON();
//    }
}

#pragma mark 返回每一组的header标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    SSettingGroup *group = self.allGroups[section];
    
    return group.header;
}
#pragma mark 返回每一组的footer标题
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    SSettingGroup *group = self.allGroups[section];
    
    return group.footer;
}


#pragma mark 返回每一组的footer高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    SSettingGroup *group = self.allGroups[section];
    return group.footerHeight;
}

#pragma mark 返回每一组的header高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    SSettingGroup *group = self.allGroups[section];
    return group.headerHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SSettingGroup *group = self.allGroups[indexPath.section];
    SSettingItem *item = group.items[indexPath.row];
    return item.rowHeight ?  item.rowHeight:44;
}



@end
