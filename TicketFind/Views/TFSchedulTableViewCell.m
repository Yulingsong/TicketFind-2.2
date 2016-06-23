//
//  TFSchedulTableViewCell.m
//  TicketFind
//
//  Created by yulingsong on 15/10/14.
//  Copyright (c) 2015年 yulingsong. All rights reserved.
//

#import "TFSchedulTableViewCell.h"


@interface TFSchedulTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *stationPoint;
@property (weak, nonatomic) IBOutlet UILabel *arrivedStationPoint;
@property (weak, nonatomic) IBOutlet UILabel *startTime;
@property (weak, nonatomic) IBOutlet UILabel *stayTime;

@end

@implementation TFSchedulTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
   
}
+(TFSchedulTableViewCell *)recreateCell
{
    return [[[NSBundle mainBundle]loadNibNamed:@"TFSchedulTableViewCell" owner:nil options:nil]lastObject];
}

- (void)setTrainNumberQuery:(TFTrainNumberQuery *)TrainNumberQuery
{
    if (TrainNumberQuery != nil) {
        self.stationPoint.text = TrainNumberQuery.station_name;
        self.arrivedStationPoint.text = TrainNumberQuery.arrived_time;
        self.startTime.text = TrainNumberQuery.leave_time;
        //self.stayTime.text = TrainNumberQuery.lishi;
    }
    _trainNumberQuery = TrainNumberQuery;
}
@end
