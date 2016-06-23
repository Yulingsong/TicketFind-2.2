//
//  TFTicketMetaData.m
//  TicketFind
//
//  Created by yulingsong on 15/10/13.
//  Copyright (c) 2015年 yulingsong. All rights reserved.
//

#import "TFTicketMetaData.h"
#import "TFTicket.h"
#import "TFTrainNumberQuery.h"
#import "TFStationList.h"

@implementation TFTicketMetaData

+ (NSArray *)getTicketJson:(NSDictionary *)jsonDic
{
    NSMutableArray *ticketMutableArray = [NSMutableArray array];
    NSArray *ticketArray = jsonDic[@"result"];
    for (NSDictionary *dic in ticketArray)
    {
        TFTicket *ticket = [TFTicket new];
        [ticket setValuesForKeysWithDictionary:dic];
        [ticketMutableArray addObject:ticket];
    }
 
    
    return [ticketMutableArray copy];
}


+(NSArray *)getTrainNumberQuery:(NSDictionary *)jsonDic
{
    NSMutableArray *TrainNumberQueryMutableArray = [NSMutableArray array];
    NSArray *trainNumberQueryArray = jsonDic[@"result"][@"station_list"];
    for (NSDictionary *dic in trainNumberQueryArray)
    {
        TFTrainNumberQuery *trainNumberQuery = [[TFTrainNumberQuery alloc]init];
        [trainNumberQuery setValuesForKeysWithDictionary:dic];
        [TrainNumberQueryMutableArray addObject:trainNumberQuery];
    }
    return [TrainNumberQueryMutableArray copy];
}

+(NSArray *)getStationListJson:(NSDictionary *)jsonDic
{
    NSMutableArray *stationListMutableArray = [NSMutableArray array];
    NSArray *stationListArray = jsonDic[@"result"];
    for (NSDictionary *dic in stationListArray)
    {
        TFStationList *stationList = [TFStationList new];
        [stationList setValuesForKeysWithDictionary:dic];
        [stationListMutableArray addObject:stationList];
    }
    return [stationListMutableArray copy];
}


@end
