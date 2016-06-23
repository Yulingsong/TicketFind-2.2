//
//  SeachResultTableViewController.m
//  Day08-1-SearchAfter-iOS8
//
//  Created by tarena on 15/8/28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "SeachResultTableViewController.h"
#import "TFStationList.h"

@interface SeachResultTableViewController ()

@end

@implementation SeachResultTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _stationListArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    TFStationList *stationList = self.stationListArray[indexPath.row];
    cell.textLabel.text = stationList.sta_name;

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TFStationList *stationList = self.stationListArray[indexPath.row];

    
    [_searchDelegate viewController:self didFinshInputWithMessage:stationList];
    
    [_searchendDelegate viewController:self didFinshEndStationInputWithMessage:stationList];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}



@end
