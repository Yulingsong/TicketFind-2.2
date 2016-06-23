//
//  TFStationList.h
//  TicketFind
//
//  Created by yulingsong on 15/10/12.
//  Copyright (c) 2015年 yulingsong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TFStationList : NSObject

@property (nonatomic,strong) NSString *sta_name;//车站名
@property (nonatomic,strong) NSString *sta_ename;//车站英文名
@property (nonatomic,strong) NSString *sta_code;//车站代码

+(id)praseStationListJson:(NSDictionary *)dic;

@end
