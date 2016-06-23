//
//  TFTicketMetaData.h
//  TicketFind
//
//  Created by yulingsong on 15/10/13.
//  Copyright (c) 2015年 yulingsong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TFTicketMetaData : NSObject

+(NSArray *)getTicketJson:(NSDictionary *)jsonDic;
+(NSArray *)getTrainNumberQuery:(NSDictionary *)jsonDic;
+(NSArray *)getStationListJson:(NSDictionary *)jsonDic;



@end


