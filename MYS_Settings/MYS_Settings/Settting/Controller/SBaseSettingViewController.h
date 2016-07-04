//
//  SBaseSettingViewController.h
//  01-S
//
//  Created by apple on 13-12-23.
//  Copyright (c) 2013年 S. All rights reserved.
//



#import <UIKit/UIKit.h>
#import "SSettingGroup.h"
#import "SSettingItem.h"

@interface SBaseSettingViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

// 所有的组模型
@property (nonatomic, strong) NSMutableArray *allGroups;
@property (nonatomic, assign) double rowHeight;


@property (nonatomic, weak) UITableView *tableView;

- (void)reledate;
@end
