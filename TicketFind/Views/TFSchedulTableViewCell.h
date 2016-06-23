//
//  TFSchedulTableViewCell.h
//  TicketFind
//
//  Created by yulingsong on 15/10/14.
//  Copyright (c) 2015年 yulingsong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TFTrainNumberQuery.h"

@interface TFSchedulTableViewCell : UITableViewCell
@property (nonatomic, strong)  TFTrainNumberQuery *trainNumberQuery;

+(TFSchedulTableViewCell *)recreateCell;
@end
