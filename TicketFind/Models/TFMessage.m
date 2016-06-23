//
//  TFMessage.m
//  TicketFind
//
//  Created by yulingsong on 15/10/13.
//  Copyright (c) 2015年 yulingsong. All rights reserved.
//

#import "TFMessage.h"

@implementation TFMessage

-(instancetype)initWithImageName:(NSString *)imageName title:(NSString *)title detail:(NSString *)detail
{
    if (self = [super init])
    {
        _imageName = imageName;
        _title = title;
        _detail = detail;
    }
    return self;
}

+(NSArray *)messageData
{
    TFMessage *m1 = [[TFMessage alloc]initWithImageName:@"n1" title:@"积分商城" detail:@"[管家自营]积分当钱花，马上去抢吧"];
    TFMessage *m2 = [[TFMessage alloc]initWithImageName:@"n2" title:@"伙力五星-订酒店" detail:@"[管家自营]品牌五星，4.9折起，送500..."];
    TFMessage *m3 = [[TFMessage alloc]initWithImageName:@"n3" title:@"伙力.食-城里人都这么吃" detail:@"[管家自营]免费请你吃百元大餐"];
    TFMessage *m4 = [[TFMessage alloc]initWithImageName:@"n4" title:@"机票预订" detail:@"[管家自营]专享航空控死直销低价"];
    TFMessage *m5 = [[TFMessage alloc]initWithImageName:@"n5" title:@"专车接送" detail:@"[管家自营]接送高铁，接送飞机"];
    TFMessage *m6 = [[TFMessage alloc]initWithImageName:@"n6" title:@"艺龙酒店" detail:@"[管家自营]高端酒店你麻痹"];
    TFMessage *m7 = [[TFMessage alloc]initWithImageName:@"n7" title:@"YHOUSE-精选美食" detail:@"[推广]5000万新用户轻奢美食券免费送！"];
    return @[m1,m2,m3,m4,m5,m6,m7];
}
@end
