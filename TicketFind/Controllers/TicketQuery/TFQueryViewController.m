//
//  TFQueryViewController.m
//  TicketFind
//
//  Created by yulingsong on 15/10/12.
//  Copyright (c) 2015年 yulingsong. All rights reserved.
//
#define filePath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"trainStation"]

#import "TFQueryViewController.h"
#import "TFStationSelectedViewController.h"
#import "AFHTTPRequestOperationManager.h"
#import "TFTicketMetaData.h"
#import "TFSearchTicketViewController.h"
#import "CalendarHomeViewController.h"
#import "CalendarViewController.h"
#import "Color.h"
#import "MBProgressHUD+MJ.h"
#import "SeachResultTableViewController.h"
#import "FMDB.h"
#import "TFHistoryData.h"
#import "TFDetailViewController.h"


@interface TFQueryViewController ()<CalendarViewControllerDelegate,TFStationSelectedViewControllerDelegate,SeachResultTableViewControllerDelegate,UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *startDate;//出发日期
@property (weak, nonatomic) IBOutlet UILabel *startTrainStation;//始发站
@property (weak, nonatomic) IBOutlet UILabel *endTrainStation;//终点站
@property (strong, nonatomic) IBOutlet UITableView *tableView;//历史搜索
@property (nonatomic,strong) NSDictionary *jsonDic;
@property (nonatomic,strong) NSArray *stationListArray;
@property (nonatomic,strong) NSArray *ticketArray;
@property (strong,nonatomic) NSArray *array;
@property (nonatomic,strong) NSMutableArray *historyDataMutableArray;
//第三方库
@property (nonatomic,strong) CalendarHomeViewController *chvc;
@property (nonatomic,strong) MBProgressHUD *hud;
@property (nonatomic,strong) CalendarDayModel *dayModel;
@property (nonatomic,strong) FMDatabase *database;
@end

@implementation TFQueryViewController

-(NSMutableArray *)historyDataMutableArray
{
    if (!_historyDataMutableArray)
    {
        _historyDataMutableArray = [NSMutableArray new];
    }
    return _historyDataMutableArray;
}

-(id)init
{
    if (self = [super init])
    {
        //设置题目
        self.title = @"车票预订";
        self.tabBarItem.image = [UIImage imageNamed:@"shouye"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"shouye_s"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //[self addSegmentController];//添加segmentController
    TFDetailViewController *detailVC = [TFDetailViewController new];
    detailVC.date = self.startTrainStation.text;
    [self queryData];
}

//添加segmentController
//-(void)addSegmentController
//{
//    UISegmentedControl *segmentedControl=[[UISegmentedControl alloc] initWithFrame:CGRectMake(40, 8, 160, 30) ];
//    [segmentedControl insertSegmentWithTitle:@"火车票" atIndex:0 animated:YES];
//    [segmentedControl insertSegmentWithTitle:@"飞机票" atIndex:1 animated:YES];
//    segmentedControl.momentary = YES;
//    segmentedControl.multipleTouchEnabled=NO;
//    //[segmentedControl addTarget:self action:@selector(Selectbutton:) forControlEvents:UIControlEventValueChanged];
//    self.navigationItem.titleView = segmentedControl;
//}


#pragma mark --- selectedStartStation选择起始站
//选择出发地点击事件
- (IBAction)selectStartStation:(id)sender
{
    [self loadStartTrainsStation];
}

//解析数据
-(void)parseSelectStartTrainStationData
{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.hud.mode = MBProgressHUDModeAnnularDeterminate;
    self.hud.labelText = @"正在搜索车站...";
    NSString *url = @"http://apis.juhe.cn/train/station.list.php?";
    NSDictionary *parameter = @{@"key":@"5aec079795e4682898867fc7d3d88933"};
    [manager GET:url parameters:parameter success:^(AFHTTPRequestOperation *operation, id jsonDic) {
        self.stationListArray = [TFTicketMetaData getStationListJson:jsonDic];
        TFStationSelectedViewController *stationSlected = [TFStationSelectedViewController new];
        stationSlected.delegate = self;
        //stationSlected.searchDelegate = self;
        stationSlected.stationListArray = self.stationListArray;
        self.hud.hidden = YES;
        
        BOOL isSucess = [jsonDic writeToFile:filePath atomically:YES];
        if (!isSucess)
        {
            NSLog(@"写入错误");
        }
        [self.navigationController pushViewController:stationSlected animated:YES];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error)
    {
        NSLog(@"Error: %@", error);
    }];
    TFStationSelectedViewController *tfSSVC = [TFStationSelectedViewController new];
    tfSSVC.tfQVC = self;
}

//加载沙盒中的数据，没有的话就重新解析，有的话就直接取
-(void)loadStartTrainsStation
{
    self.jsonDic = [NSDictionary dictionaryWithContentsOfFile:filePath];
    if (self.jsonDic == nil)
    {
        [self parseSelectStartTrainStationData];
    }
    else
    {
        self.stationListArray = [TFTicketMetaData getStationListJson:self.jsonDic];
        TFStationSelectedViewController *tfSSVC = [TFStationSelectedViewController new];
        tfSSVC.tfQVC = self;
        TFStationSelectedViewController *stationSlected = [TFStationSelectedViewController new];
        stationSlected.delegate = self;
        stationSlected.stationListArray = self.stationListArray;
        self.hud.hidden = YES;
        [self.navigationController pushViewController:stationSlected animated:YES];
    }
}

//代理反向传值 实现方法
-(void)viewController:(TFStationSelectedViewController *)viewcontroller didFinshInputWithMessage:(TFStationList *)msg
{
    self.startTrainStation.text = msg.sta_name;
    //测试
    //NSLog(@"选择的开始站点%@", _startTrainStation.text);
}


#pragma mark --- selectedEndStation选择终点站
//选择目的地点击时间
- (IBAction)selectEndStation:(id)sender
{
    [self loadEndTrainsStation];
}

//解析数据
-(void)parseSelectEndTrainStationData
{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    NSString *url = @"http://apis.juhe.cn/train/station.list.php?";
    self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.hud.mode = MBProgressHUDModeAnnularDeterminate;
    self.hud.labelText = @"正在搜索车站...";
    NSDictionary *parameter = @{@"key":@"5aec079795e4682898867fc7d3d88933"};
    [manager GET:url parameters:parameter success:^(AFHTTPRequestOperation *operation, id jsonDic) {
        self.stationListArray = [TFTicketMetaData getStationListJson:jsonDic];
        TFStationSelectedViewController *stationSlected = [TFStationSelectedViewController new];
        stationSlected.endDelegate = self;
        stationSlected.stationListArray = self.stationListArray;
        self.hud.hidden = YES;
        [self.navigationController pushViewController:stationSlected animated:YES];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    TFStationSelectedViewController *tfSSVC = [TFStationSelectedViewController new];
    tfSSVC.tfQVC = self;
}

//判断沙盒里是否已经有数据了，若没有，就再解析，要是有数据，就从沙盒读出来
-(void)loadEndTrainsStation
{
    self.jsonDic = [NSDictionary dictionaryWithContentsOfFile:filePath];
    if (self.jsonDic == nil)
    {
        [self parseSelectStartTrainStationData];
        
    }
    else
    {
        self.stationListArray = [TFTicketMetaData getStationListJson:self.jsonDic];
        TFStationSelectedViewController *tfSSVC = [TFStationSelectedViewController new];
        tfSSVC.tfQVC = self;
        TFStationSelectedViewController *stationSlected = [TFStationSelectedViewController new];
        stationSlected.endDelegate = self;
        stationSlected.stationListArray = self.stationListArray;
        self.hud.hidden = YES;
        [self.navigationController pushViewController:stationSlected animated:YES];
    }
}

- (void)viewController:(TFStationSelectedViewController *)viewcontroller didFinshEndStationInputWithMessage:(TFStationList *)endStationName
{
    self.endTrainStation.text = endStationName.sta_name;
}


//交换出发地与目的地
- (IBAction)changeStartAndEndStation:(id)sender
{
    NSString *change = self.startTrainStation.text;
    self.startTrainStation.text = self.endTrainStation.text;
    self.endTrainStation.text = change;
}

#pragma mark --- selectedDate
//选择日期
- (IBAction)selectDate:(id)sender
{
    if (!_chvc) {
        _chvc = [[CalendarHomeViewController alloc]init];
        _chvc.calendartitle = @"请选择出发日期";
        [_chvc setAirPlaneToDay:365 ToDateforString:nil];//飞机初始化方法
        _chvc.delegate = self;
    }
    [self.navigationController pushViewController:_chvc animated:YES];
}
- (void)passValue:(CalendarDayModel *)model {
    self.startDate.text = [NSString stringWithFormat:@"%@ %@",[model toString],[model getWeek]];
}

#pragma mark --- searchTicket搜索车票
//搜索车票
- (IBAction)searchTickets:(id)sender
{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    NSString *url = @"http://apis.juhe.cn/train/yp?";
    self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.hud.mode = MBProgressHUDModeAnnularDeterminate;
    self.hud.labelText = @"正在搜索车站...";
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    parameter[@"key"] = @"5aec079795e4682898867fc7d3d88933";
    parameter[@"from"] = self.startTrainStation.text != nil ? self.startTrainStation.text : @"南京";
    parameter[@"to"] = self.endTrainStation.text != nil ? self.endTrainStation.text : @"北京";
    parameter[@"date"] = self.dayModel != nil ? self.dayModel.toString : [self getTime];
    
    [manager GET:url parameters:parameter success:^(AFHTTPRequestOperation *operation, id jsonDic) {
        //NSLog(@"%@.....",jsonDic);
        self.ticketArray = [TFTicketMetaData getTicketJson:jsonDic];
        TFSearchTicketViewController *searchTicket = [TFSearchTicketViewController new];
        searchTicket.ticketArray = self.ticketArray;
        //NSLog(@"%ld",self.ticketArray.count);
        self.hud.hidden = YES;
        [self.navigationController pushViewController:searchTicket animated:YES];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
        NSLog(@"Error: %@", error);
    }];
   
    
    [self createSQLite];
    [self insertData];
}

- (NSString *)getTime {
    NSDateFormatter *dataFormatter = [[NSDateFormatter alloc]init];
    [dataFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateTime = [dataFormatter stringFromDate:[NSDate date]];
    return dateTime;
}

#pragma  mark --- SQLite
//创建数据库
-(void)createSQLite
{
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString *sqlitePath = [documentsPath stringByAppendingPathComponent:@"history.sqlite"];
    
    self.database = [FMDatabase databaseWithPath:sqlitePath];
    
    if ([self.database open])
    {
        BOOL isSuccess = [self.database executeUpdate:@"create table history (id integer primary key, startStation text, endStation text)"];
        if (!isSuccess)
        {
            NSLog(@"创建表失败%@", [self.database lastError]);
        }
    }
    
    [self.database close];
}

//插入数据
- (void)insertData
{
    NSString *startName = self.startTrainStation.text;
    NSString *endName = self.endTrainStation.text;
    for (TFHistoryData *search in self.array)
    {
        if ([search.startStation isEqualToString:startName] && [search.endStation isEqualToString:endName])
        {
            return;
        }
    }

    //打开数据库
    if ([self.database open]) {
        //插入数据
        //方式一：带有参数的插入sql语句
        NSString *startStation = self.startTrainStation.text;
        NSString *endtStation = self.endTrainStation.text;
        BOOL isSuccess = [self.database executeUpdate:@"insert into history (startStation, endStation) values (?,?)",startStation,endtStation];
        
        if (!isSuccess) {
            NSLog(@"插入数据失败%@", [self.database lastError]);
        }
    }
    
    //关闭数据库
    [self.database close];
}

//查询数据
- (void)queryData
{
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString *sqlitePath = [documentsPath stringByAppendingPathComponent:@"history.sqlite"];
    self.database = [FMDatabase databaseWithPath:sqlitePath];
    
    if ([self.database open])
    {
        FMResultSet *resultSet = [self.database executeQuery:@"select *from history"];
        
        while ([resultSet next])
        {
            TFHistoryData *histryData = [TFHistoryData new];
            histryData.startStation = [resultSet stringForColumn:@"startStation"];
            histryData.endStation = [resultSet stringForColumn:@"endStation"];
            //NSLog(@"%@------------",histryData.startStation);
            [self.historyDataMutableArray addObject:histryData];
        }
    }
    [self.database close];
}

- (void)clearData
{
    if ([self.database open])
    {
        BOOL isSucess = [self.database executeUpdate:@"delete from history"];
        if (!isSucess)
        {
            NSLog(@"清楚数据失败%@", [self.database lastError]);
        }
    }
    [self.database close];
    [self queryData];
    [self.tableView reloadData];
}



- (IBAction)clearHistoryData:(id)sender
{
    [self clearData];
}

//设置历史搜索记录tableview
#pragma mark --- UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.historyDataMutableArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"MyCell"];
        
    }
    TFHistoryData *histryData = self.historyDataMutableArray[indexPath.row];
    cell.textLabel.text = histryData.startStation;
    cell.detailTextLabel.text = histryData.endStation;
    cell.detailTextLabel.textColor = [UIColor blackColor];
    
    return cell;
}



@end
