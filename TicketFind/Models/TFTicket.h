//
//  TFTicket.h
//  TicketFind
//
//  Created by yulingsong on 15/10/13.
//  Copyright (c) 2015年 yulingsong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TFTicket : NSObject

@property (nonatomic,strong) NSString *train_no;            /*车次*/
@property (nonatomic,strong) NSString *start_station_name;	/*车次始发站*/
@property (nonatomic,strong) NSString *end_station_name;	/*车次终点站*/
@property (nonatomic,strong) NSString *from_station_name;	/*出发站*/
@property (nonatomic,strong) NSString *to_station_name;		/*到达站*/
@property (nonatomic,strong) NSString *start_time;          /*出发时间*/
@property (nonatomic,strong) NSString *arrive_time;         /*到达时间*/
@property (nonatomic,strong) NSString *train_class_name;    /*车次类型*/
@property (nonatomic,strong) NSString *day_difference;      /*历时天数*/
@property (nonatomic,strong) NSString *lishi;	/*总历时时间*/
@property (nonatomic,strong) NSString *gr_num;	/*高级软卧：-- 说明无该席位*/
@property (nonatomic,strong) NSString *qt_num;	/*其他*/
@property (nonatomic,strong) NSString *rw_num;	/*软卧*/
@property (nonatomic,strong) NSString *rz_num;	/*软座*/
@property (nonatomic,strong) NSString *tz_num;	/*特等座*/
@property (nonatomic,strong) NSString *wz_num;	/*无座*/
@property (nonatomic,strong) NSString *yw_num;	/*硬卧*/
@property (nonatomic,strong) NSString *yz_num;	/*硬座*/
@property (nonatomic,strong) NSString *ze_num;	/*二等座*/
@property (nonatomic,strong) NSString *zy_num;	/*一等座*/
@property (nonatomic,strong) NSString *swz_num;	/*商务座*/

@end
