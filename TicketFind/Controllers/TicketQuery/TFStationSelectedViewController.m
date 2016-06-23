//
//  TFStationSelectedViewController.m
//  TicketFind
//
//  Created by yulingsong on 15/10/12.
//  Copyright (c) 2015年 yulingsong. All rights reserved.
//

#import "TFStationSelectedViewController.h"
#import "TFStationList.h"
#import "SeachResultTableViewController.h"

@interface TFStationSelectedViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchResultsUpdating,UISearchDisplayDelegate,UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UITableView *stationTableView;
@property(nonatomic,strong) UISearchController *searchController;
@end

@implementation TFStationSelectedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"车站选择";
    self.searchController.searchBar.placeholder = @"请输入车站名称";
    
    SeachResultTableViewController *resultVC = [SeachResultTableViewController new];
    //初始化iOS独有的搜索控制器，传参是用于显示搜索结果的控制器
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:resultVC];
    //设置显示的搜索条的大小和样式
    [self.searchController.searchBar sizeToFit];
    
    //设置搜索控制器结果更新时由谁来代理
    self.searchController.searchResultsUpdater = self;
    //将搜索条添加到表头视图中
    self.stationTableView.tableHeaderView = self.searchController.searchBar;
    //设置是否在数据发生变更时,允许切换控制器
    self.definesPresentationContext = YES;
    //为了获取scope按钮改变的时机,需要设置搜索框的代理
    //searchBar中包含一个文本框和一个分段控件
    self.searchController.searchBar.delegate = self;
    self.tabBarController.tabBar.hidden=YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden=NO;
}

#pragma mark --- UITableView Delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.stationListArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        cell.textLabel.font = [UIFont systemFontOfSize:16];
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
    }
    TFStationList *stationList = self.stationListArray[indexPath.row];
    cell.textLabel.text = stationList.sta_name;

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TFStationList *stationList = self.stationListArray[indexPath.row];
    //_tfQVC.startStation = stationList.sta_name;
    NSLog(@"%@",_tfQVC.startStation);
    NSLog(@"%@",stationList.sta_name);
    
    [_delegate viewController:self didFinshInputWithMessage:stationList];
    
    [_endDelegate viewController:self didFinshEndStationInputWithMessage:stationList];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

#pragma mark - UISearchResultsUpdating
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    //获取用户输入的搜索文本
    NSString *text = searchController.searchBar.text;
    //获取用户选择的scope
    //NSInteger selectedIndex = searchController.searchBar.selectedScopeButtonIndex;
    NSMutableArray *tempArr = [NSMutableArray array];
    for (TFStationList *stationList in self.stationListArray) {
        NSRange range = [stationList.sta_name rangeOfString:text];
        NSRange range1 = [stationList.sta_ename rangeOfString:text];
        if (range.location != NSNotFound || range1.location != NSNotFound)
        {
            [tempArr addObject:stationList];
        }
    }
    //把搜索结果传入到搜索结果展示控制器中，并刷新它的界面
    SeachResultTableViewController *searchVC = (SeachResultTableViewController *)searchController.searchResultsController;
    searchVC.stationListArray = tempArr;
    [searchVC.tableView reloadData];
}




#pragma mark - UISearchBarDelegate
- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope{
    [self updateSearchResultsForSearchController:self.searchController];
}

@end
