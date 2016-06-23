//
//  TFScheduleViewController.m
//  TicketFind
//
//  Created by yulingsong on 15/10/14.
//  Copyright (c) 2015年 yulingsong. All rights reserved.
//

#import "TFScheduleViewController.h"
#import "TFSchedulTableViewCell.h"
#import "TFTrainNumberQuery.h"
#import "TFTicketMetaData.h"

@interface TFScheduleViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *schedulTableView;


@end

@implementation TFScheduleViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSArray *array=self.tabBarController.view.subviews;
    UIView *view=array[array.count - 1];
    view.frame=CGRectMake(0, self.view.frame.size.height, 320, 49);
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSArray *array=self.tabBarController.view.subviews;
    UIView *view=array[array.count - 1];
    view.frame=CGRectMake(0, self.view.frame.size.height - 49, 320, 49);
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.schedulTableView setSeparatorColor:[UIColor clearColor]];
}

#pragma mark --- UITableView Delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.trainNuberQueryArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"myCell";
    TFSchedulTableViewCell *SchedulTableViewCell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!SchedulTableViewCell)
    {
        SchedulTableViewCell = [TFSchedulTableViewCell recreateCell];
    }
    SchedulTableViewCell.trainNumberQuery = self.trainNuberQueryArray[indexPath.row];
    
    return SchedulTableViewCell;
}

@end
