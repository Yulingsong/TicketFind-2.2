//
//  TFTrainServiceTableViewCell.h
//  TicketFind
//
//  Created by yulingsong on 15/10/13.
//  Copyright (c) 2015年 yulingsong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TFTrainServiceTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *adImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;


+(TFTrainServiceTableViewCell *)recreateNewCell;
@end
