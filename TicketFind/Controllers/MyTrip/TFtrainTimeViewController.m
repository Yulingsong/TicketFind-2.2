//
//  TFtrainTimeViewController.m
//  TicketFind
//
//  Created by yulingsong on 15/10/14.
//  Copyright (c) 2015年 yulingsong. All rights reserved.
//

#import "TFtrainTimeViewController.h"
#import "CalendarHomeViewController.h"
#import "CalendarViewController.h"
#import "Color.h"
#import "TFScheduleViewController.h"
#import "TFTicketMetaData.h"
#import "MBProgressHUD+MJ.h"
#import "AFHTTPRequestOperationManager.h"
#import "TFMyTripViewController.h"
@interface TFtrainTimeViewController ()<CalendarViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (nonatomic,strong) CalendarHomeViewController *chvc;
@property (nonatomic,strong) NSString *TrainNo;
@property (nonatomic,strong) NSArray *trainNuberQueryArray;
@property (nonatomic,strong) MBProgressHUD *hud;
@end

@implementation TFtrainTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"车次时刻";
    self.tabBarController.tabBar.hidden=YES;
    self.TrainNo = self.textField.text;
//    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
//    
//    backItem.title = @"返回";
//    
//    self.navigationItem.backBarButtonItem = backItem;

}
- (void)viewWillDisappear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden=NO;
}

- (IBAction)selectedDate:(id)sender
{
    if (!_chvc)
    {
        _chvc = [[CalendarHomeViewController alloc]init];
        _chvc.calendartitle = @"请选择出发日期";
        [_chvc setAirPlaneToDay:365 ToDateforString:nil];//飞机初始化方法
        _chvc.delegate = self;
    }
    [self.navigationController pushViewController:_chvc animated:YES];
}
- (IBAction)inputTrainNo:(UITextField *)sender
{
    [self.textField resignFirstResponder];
    [self makeSure:nil];
}

- (void)passValue:(CalendarDayModel *)model
{
    self.dateLabel.text = [NSString stringWithFormat:@"%@ %@",[model toString],[model getWeek]];

}

- (IBAction)makeSure:(id)sender
{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    NSString *url = @"http://apis.juhe.cn/train/s";
    self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.hud.mode = MBProgressHUDModeAnnularDeterminate;
    self.hud.labelText = @"正在搜索车票...";
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    parameter[@"key"] = @"5aec079795e4682898867fc7d3d88933";
    parameter[@"name"] = self.textField.text;
    [manager GET:url parameters:parameter success:^(AFHTTPRequestOperation *operation, id jsonDic) {
        self.trainNuberQueryArray = [TFTicketMetaData getTrainNumberQuery:jsonDic];
        self.hud.hidden = YES;
        TFScheduleViewController *scheduleVC = [TFScheduleViewController new];
        scheduleVC.trainNuberQueryArray = self.trainNuberQueryArray;
        [self.navigationController pushViewController:scheduleVC animated:YES];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}



@end
