//
//  TFPersonalCenterViewController.m
//  TicketFind
//
//  Created by yulingsong on 15/10/13.
//  Copyright (c) 2015年 yulingsong. All rights reserved.
//

#import "TFPersonalCenterViewController.h"

@interface TFPersonalCenterViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *perosonCenterTableView;

@end

@implementation TFPersonalCenterViewController
-(id)init
{
    if (self = [super init])
    {
        //设置题目
        self.title = @"个人中心";
        //设置图片,两种状态，正常和选中
        self.tabBarItem.image = [UIImage imageNamed:@"tabbar_item_more"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_item_more_selected"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.automaticallyAdjustsScrollViewInsets = false;
}


#pragma mark --- UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 3;
    }
    else
    {
        return 6;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        cell.textLabel.font = [UIFont systemFontOfSize:16];
        cell.detailTextLabel.font = [UIFont systemFontOfSize:12];
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.section == 0)
    {
        switch (indexPath.row)
        {
            case 0:
                cell.textLabel.text = @"火车票订单";
                cell.detailTextLabel.text = @"12306在线退票，改签";
                break;
            case 1:
                cell.textLabel.text = @"全部订单";
                cell.detailTextLabel.text = @"抢票，机票，酒店，商城等";
                break;
            case 2:
                cell.textLabel.text = @"积分商城";
                break;
                
            default:
                return 0;
                break;
        }
    }
    else
    {
        switch (indexPath.row)
        {
            case 0:
                cell.textLabel.text = @"高铁客服中心";
                break;
            case 1:
                cell.textLabel.text = @"客服电话-反欺诈";
                break;
            case 2:
                cell.textLabel.text = @"身份核验须知";
                break;
            case 3:
                cell.textLabel.text = @"订火车票满5元送红包";
                break;
            case 4:
                cell.textLabel.text = @"快乐赚积分";
                break;
            case 5:
                cell.textLabel.text = @"更多";
                break;
                
            default:
                return 0;
                break;
        }
    }
    return cell;
}


@end
