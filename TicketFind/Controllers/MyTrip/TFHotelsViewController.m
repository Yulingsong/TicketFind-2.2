//
//  TFHotelsViewController.m
//  TicketFind
//
//  Created by yulingsong on 15/10/14.
//  Copyright (c) 2015年 yulingsong. All rights reserved.
//

#import "TFHotelsViewController.h"

@interface TFHotelsViewController ()<UITableViewDataSource,UITableViewDelegate>


@end

@implementation TFHotelsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"伙力特惠五星";
    self.tabBarController.tabBar.hidden=YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden=NO;
}

#pragma mark --- UITableViewDelegate

@end
