//
//  TFDetailViewController.m
//  TicketFind
//
//  Created by yulingsong on 15/10/14.
//  Copyright (c) 2015年 yulingsong. All rights reserved.
//

#import "TFDetailViewController.h"
#import "TFScheduleViewController.h"
#import "TFTicketMetaData.h"
#import "MBProgressHUD+MJ.h"
#import "AFHTTPRequestOperationManager.h"

@interface TFDetailViewController ()
@property (nonatomic,strong) NSArray *trainNuberQueryArray;
@property (nonatomic,strong) MBProgressHUD *hud;
@property (strong, nonatomic) IBOutlet UILabel *dateLb;

@property (weak, nonatomic) IBOutlet UILabel *ze_num;
@property (weak, nonatomic) IBOutlet UILabel *zy_num;
@property (weak, nonatomic) IBOutlet UILabel *swz_num;

@end

@implementation TFDetailViewController

//让界面显示的时候tabbar消失，不影响使用
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

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.ze_num.text = self.searchTicketVC.
    //_dateLb.text = _date;
}
- (IBAction)jumpToDetail:(id)sender
{    
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    NSString *url = @"http://apis.juhe.cn/train/s";
    self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.hud.mode = MBProgressHUDModeAnnularDeterminate;
    self.hud.labelText = @"正在搜索车票...";
    NSDictionary *parameter = @{@"key":@"5aec079795e4682898867fc7d3d88933",@"name":_ticket.train_no};
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
