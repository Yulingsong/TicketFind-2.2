//
//  TFQueryViewController.h
//  TicketFind
//
//  Created by yulingsong on 15/10/12.
//  Copyright (c) 2015年 yulingsong. All rights reserved.
//

#import "ViewController.h"

@interface TFQueryViewController : ViewController
//公开一个属性，用于接收B回传回来的值。
@property (nonatomic, strong) NSString *startStation;
@property (nonatomic, strong) NSString *endStation;

@end
