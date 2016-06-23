//
//  TFDetailViewController.h
//  TicketFind
//
//  Created by yulingsong on 15/10/14.
//  Copyright (c) 2015年 yulingsong. All rights reserved.
//

#import "ViewController.h"
#import "TFTrainNumberQuery.h"
#import "TFTicket.h"
#import "TFSearchTicketViewController.h"

@interface TFDetailViewController : ViewController
@property (nonatomic,strong) TFTrainNumberQuery *trainNOQuery;
@property (nonatomic,strong) TFTicket *ticket;
@property (nonatomic,strong) TFSearchTicketViewController *searchTicketVC;
//正向传值，传递日期
@property (nonatomic,strong) NSString *date;
@end
