//
//  TFHistoryTableViewCell.m
//  TicketFind
//
//  Created by yulingsong on 15/10/26.
//  Copyright © 2015年 yulingsong. All rights reserved.
//

#import "TFHistoryTableViewCell.h"


@interface TFHistoryTableViewCell()

@property (strong, nonatomic) IBOutlet UILabel *startLb;

@property (strong, nonatomic) IBOutlet UILabel *endLb;


@end
@implementation TFHistoryTableViewCell

+ (TFHistoryTableViewCell *)searchCell {
    return [[[NSBundle mainBundle]loadNibNamed:@"TFHistoryTableViewCell" owner:nil options:nil]lastObject];
}


- (void)setHistory:(TFHistoryData *)history {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.startLb.text = history.startStation;
    self.endLb.text = history.endStation;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
