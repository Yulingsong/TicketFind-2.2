//
//  TFMyTripViewController.m
//  TicketFind
//
//  Created by yulingsong on 15/10/13.
//  Copyright (c) 2015年 yulingsong. All rights reserved.
//

#import "TFMyTripViewController.h"
#import "TFHotelsViewController.h"
#import "TFtrainTimeViewController.h"
#import "TFstationViewController.h"

@interface TFMyTripViewController ()

@end

@implementation TFMyTripViewController

-(id)init
{
    if (self = [super init])
    {
        //设置题目
        self.title = @"我的行程";
        //设置图片,两种状态，正常和选中
        self.tabBarItem.image = [UIImage imageNamed:@"tabbar_item_my_music"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_item_my_music_selected"];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
   
}
- (IBAction)hotel:(id)sender
{
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleDone target:nil action:nil];
    [self.navigationItem setBackBarButtonItem:backItem];
    [self.navigationController pushViewController:[TFHotelsViewController new] animated:YES];
}

- (IBAction)trainTime:(id)sender
{
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleDone target:nil action:nil];
    [self.navigationItem setBackBarButtonItem:backItem];
    [self.navigationController pushViewController:[TFtrainTimeViewController new] animated:YES];
}
- (IBAction)station:(id)sender
{
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleDone target:nil action:nil];
    [self.navigationItem setBackBarButtonItem:backItem];
    [self.navigationController pushViewController:[TFstationViewController new] animated:YES];
}



@end
