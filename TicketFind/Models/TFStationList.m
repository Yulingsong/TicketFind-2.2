//
//  TFStationList.m
//  TicketFind
//
//  Created by yulingsong on 15/10/12.
//  Copyright (c) 2015年 yulingsong. All rights reserved.
//

#import "TFStationList.h"

@implementation TFStationList

+(id)praseStationListJson:(NSDictionary *)dic
{
    return [[self alloc]initWithStationListJson:(NSDictionary *)dic];
}

-(id)initWithStationListJson:(NSDictionary *)dic
{
    if (self = [super init])
    {
        self.sta_name = dic[@"sta_name"];
        self.sta_ename = dic[@"sta_ename"];
        self.sta_code = dic[@"sta_code"];
    }
    return self;
}
@end
