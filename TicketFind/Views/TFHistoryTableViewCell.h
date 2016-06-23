//
//  TFHistoryTableViewCell.h
//  TicketFind
//
//  Created by yulingsong on 15/10/26.
//  Copyright © 2015年 yulingsong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TFHistoryData.h"

@interface TFHistoryTableViewCell : UITableViewCell
@property (nonatomic,strong) TFHistoryTableViewCell *history;

+ (TFHistoryTableViewCell *)searchCell;
@end
