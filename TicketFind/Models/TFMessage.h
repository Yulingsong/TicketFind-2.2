//
//  TFMessage.h
//  TicketFind
//
//  Created by yulingsong on 15/10/13.
//  Copyright (c) 2015年 yulingsong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TFMessage : NSObject

@property (nonatomic,strong) NSString *imageName;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *detail;

-(instancetype)initWithImageName:(NSString *)imageName title:(NSString *)title detail:(NSString *)detail;
+(NSArray *)messageData;


@end
