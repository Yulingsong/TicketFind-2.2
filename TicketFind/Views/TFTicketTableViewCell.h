//
//  TFTicketTableViewCell.h
//  TicketFind
//
//  Created by yulingsong on 15/10/13.
//  Copyright (c) 2015年 yulingsong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TFTicket.h"

@interface TFTicketTableViewCell : UITableViewCell
@property (nonatomic, strong) TFTicket *ticket;

+ (id)recreateCell;
@end
