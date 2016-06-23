//
//  TFSearchTicketViewController.m
//  TicketFind
//
//  Created by yulingsong on 15/10/13.
//  Copyright (c) 2015年 yulingsong. All rights reserved.
//

#import "TFSearchTicketViewController.h"
#import "TFSearchTicketViewController.h"
#import "TFTicketTableViewCell.h"
#import "TFTicketMetaData.h"
#import "TFTicket.h"
#import "TFDetailViewController.h"

@interface TFSearchTicketViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
//@property (nonatomic,strong) NSArray *ticketArray;
@end

@implementation TFSearchTicketViewController
//- (void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    NSArray *array=self.tabBarController.view.subviews;
//    UIView *view=array[array.count - 1];
//    view.frame=CGRectMake(0, self.view.frame.size.height, 320, 49);
//    
//}
//
//- (void)viewWillDisappear:(BOOL)animated{
//    [super viewWillDisappear:animated];
//    NSArray *array=self.tabBarController.view.subviews;
//    UIView *view=array[array.count - 1];
//    view.frame=CGRectMake(0, self.view.frame.size.height - 49, 320, 49);
//    
//}
- (void)viewDidLoad
{
    [super viewDidLoad];
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

#pragma mark -- UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.ticketArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"myCell";
    TFTicketTableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!tableViewCell)
    {
        tableViewCell = [TFTicketTableViewCell recreateCell];
    }
    tableViewCell.ticket = self.ticketArray[indexPath.row];
    
    return tableViewCell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TFDetailViewController *detailViewVC = [TFDetailViewController new];
    detailViewVC.ticket = self.ticketArray[indexPath.row];
    [self.navigationController pushViewController:detailViewVC animated:YES];
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}
@end
