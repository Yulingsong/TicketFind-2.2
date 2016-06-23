//
//  TFstationViewController.m
//  TicketFind
//
//  Created by yulingsong on 15/10/14.
//  Copyright (c) 2015年 yulingsong. All rights reserved.
//

#import "TFstationViewController.h"

@interface TFstationViewController ()

@end

@implementation TFstationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"火车站";
    self.tabBarController.tabBar.hidden=YES;
}
- (void)viewWillDisappear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden=NO;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
