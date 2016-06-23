//
//  SeachResultTableViewController.h
//  Day08-1-SearchAfter-iOS8
//
//  Created by tarena on 15/8/28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TFStationList.h"

@class SeachResultTableViewController;
@protocol SeachResultTableViewControllerDelegate <NSObject>

-(void)viewController:(SeachResultTableViewController *)viewcontroller didFinshInputWithMessage:(TFStationList *)msg;


- (void)viewController:(SeachResultTableViewController *)viewcontroller didFinshEndStationInputWithMessage:(TFStationList *)endStationName;

@end

//用于显示搜索结果的表视图控制器
//需要公开一个数组属性，接收待显示的商品数据
@interface SeachResultTableViewController : UITableViewController

@property (nonatomic,retain)id<SeachResultTableViewControllerDelegate>searchDelegate;
@property (nonatomic,retain)id<SeachResultTableViewControllerDelegate>searchendDelegate;
@property (nonatomic,strong) NSArray *stationListArray;
@end



