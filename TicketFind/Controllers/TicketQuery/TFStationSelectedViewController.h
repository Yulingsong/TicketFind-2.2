//
//  TFStationSelectedViewController.h
//  TicketFind
//
//  Created by yulingsong on 15/10/12.
//  Copyright (c) 2015年 yulingsong. All rights reserved.
//

#import "ViewController.h"
#import "TFQueryViewController.h"
#import "TFStationList.h"

@class TFStationSelectedViewController;
@protocol TFStationSelectedViewControllerDelegate <NSObject>

-(void)viewController:(TFStationSelectedViewController *)viewcontroller didFinshInputWithMessage:(TFStationList *)msg;


- (void)viewController:(TFStationSelectedViewController *)viewcontroller didFinshEndStationInputWithMessage:(TFStationList *)endStationName;

@end


@interface TFStationSelectedViewController : ViewController
@property (nonatomic,strong) NSArray *stationListArray;
//使用weak的原因？
//因为A推出B，A创建了B实例，所以A强引用了B。 现在B反过来又要引用A， 如果还是强引用，那么会形成循环引用，导致内存泄露。
//strong强引用  weak弱引用
@property (nonatomic, weak) TFQueryViewController *tfQVC;

@property (nonatomic,retain)id<TFStationSelectedViewControllerDelegate>delegate;
@property (nonatomic, retain)id<TFStationSelectedViewControllerDelegate>endDelegate;



@end
