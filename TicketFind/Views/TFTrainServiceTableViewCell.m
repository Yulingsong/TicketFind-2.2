//
//  TFTrainServiceTableViewCell.m
//  TicketFind
//
//  Created by yulingsong on 15/10/13.
//  Copyright (c) 2015年 yulingsong. All rights reserved.
//

#import "TFTrainServiceTableViewCell.h"


@implementation TFTrainServiceTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(TFTrainServiceTableViewCell *)recreateNewCell
{
    return [[[NSBundle mainBundle]loadNibNamed:@"TFTrainServiceTableViewCell" owner:nil options:nil]lastObject];
}
@end
