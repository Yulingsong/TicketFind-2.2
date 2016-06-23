//
//  TFTicketTableViewCell.m
//  TicketFind
//
//  Created by yulingsong on 15/10/13.
//  Copyright (c) 2015年 yulingsong. All rights reserved.
//

#import "TFTicketTableViewCell.h"


@interface TFTicketTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *train_NOLabel;
@property (weak, nonatomic) IBOutlet UILabel *start_timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *end_timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *lishiLabel;
@property (weak, nonatomic) IBOutlet UILabel *start_station_nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *end_station_nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *swz_numLabel;


@end
@implementation TFTicketTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

+(id)recreateCell
{
    return [[[NSBundle mainBundle]loadNibNamed:@"TFTicketTableViewCell" owner:nil options:nil]lastObject];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (void)setTicket:(TFTicket *)ticket
{
    if (ticket != nil) {
        self.train_NOLabel.text = ticket.train_no;
        self.start_timeLabel.text = ticket.start_time;
        self.end_timeLabel.text = ticket.arrive_time;
        self.lishiLabel.text = ticket.lishi;
        self.start_station_nameLabel.text = ticket.from_station_name;
        self.end_station_nameLabel.text = ticket.to_station_name;
        self.swz_numLabel.text = ticket.ze_num;
        NSLog(@"----%@",ticket.ze_num);
    }
    
    if ([ticket.ze_num isEqualToString:@"无"])
    {
        self.swz_numLabel.backgroundColor = [UIColor redColor];
    }
    else if (ticket.ze_num.intValue >= 100)
    {
        self.swz_numLabel.backgroundColor = [UIColor lightGrayColor];
    }
    else
    {
        self.swz_numLabel.backgroundColor = [UIColor orangeColor];
    }
    
    _ticket = ticket;
}
@end
