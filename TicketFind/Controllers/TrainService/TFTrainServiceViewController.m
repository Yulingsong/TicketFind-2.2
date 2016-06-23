//
//  TFTrainServiceViewController.m
//  TicketFind
//
//  Created by yulingsong on 15/10/13.
//  Copyright (c) 2015年 yulingsong. All rights reserved.
//

#import "TFTrainServiceViewController.h"
#import "TFTrainServiceTableViewCell.h"
#import "TFMessage.h"

@interface TFTrainServiceViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSArray *messageArray;

@end

@implementation TFTrainServiceViewController

-(NSArray *)messageArray
{
    if (!_messageArray)
    {
        _messageArray = [TFMessage messageData];
    }
    return _messageArray;
}

-(id)init
{
    if (self = [super init])
    {
        //设置题目
        self.title = @"旅行服务";
        //设置图片,两种状态，正常和选中
        self.tabBarItem.image = [UIImage imageNamed:@"tabbar_item_store"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_item_store_selected"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

#pragma mark --- UITableView Delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 1;
    }
    else
        return 6;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"myCell";
    TFTrainServiceTableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!tableViewCell)
    {
        tableViewCell = [TFTrainServiceTableViewCell recreateNewCell];
    }
    
    if (indexPath.section == 0)
    {
        TFMessage *message = self.messageArray[indexPath.row];
        tableViewCell.titleLabel.text = message.title;
        tableViewCell.detailLabel.text = message.detail;
        tableViewCell.adImageView.image = [UIImage imageNamed:message.imageName];
    }
    else
    {
        TFMessage *message = self.messageArray[indexPath.row +1];
        tableViewCell.titleLabel.text = message.title;
        tableViewCell.detailLabel.text = message.detail;
        tableViewCell.adImageView.image = [UIImage imageNamed:message.imageName];
    }
    
    tableViewCell.titleLabel.font = [UIFont systemFontOfSize:17];
    tableViewCell.detailLabel.font = [UIFont systemFontOfSize:12];
    
    return tableViewCell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
@end
