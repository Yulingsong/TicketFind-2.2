//
//  MIWelcomeViewController.m
//  MovieInformation
//
//  Created by yulingsong on 15/10/12.
//  Copyright (c) 2015年 yulingsong. All rights reserved.
//
#define userDefault [NSUserDefaults standardUserDefaults]
#import "TFWelcomeViewController.h"
#import "TFQueryViewController.h"
#import "TFPersonalCenterViewController.h"
#import "TFMyTripViewController.h"
#import "TFTrainServiceViewController.h"

@interface TFWelcomeViewController ()<UIScrollViewDelegate>
//@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
//@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@end

@implementation TFWelcomeViewController




- (void)viewDidAppear:(BOOL)animated{
    if ([userDefault boolForKey:@"isShow"]) {
        [self clickLogin];
    }
    //记录是否是否已经显示过
    
    [userDefault setBool:YES forKey:@"isShow"];
    [userDefault synchronize];
}


- (void)viewDidLoad {
    [super viewDidLoad];

    if (![userDefault boolForKey:@"isShow"]) {
        [self setOtherThings];
    }
    
   
    
}

-(void)setOtherThings
{
    UIScrollView *welcomeScrollview = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:welcomeScrollview];
    NSArray * welcomeImageName = @[@"welcome_1",@"welcome_2",@"welcome_3",@"welcome_4"];
    for (int i = 0; i < welcomeImageName.count; i++)
    {
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:welcomeImageName[i]]];
        imageView.frame = CGRectMake(i * welcomeScrollview.frame.size.width, 0, welcomeScrollview.frame.size.width, welcomeScrollview.frame.size.height);
        [welcomeScrollview addSubview:imageView];
    }
    
    //设置内容大小
    welcomeScrollview.contentSize = CGSizeMake(welcomeScrollview.frame.size.width * welcomeImageName.count, 0);
    
    welcomeScrollview.pagingEnabled = YES;//翻页形式
    welcomeScrollview.showsHorizontalScrollIndicator = NO;
    welcomeScrollview.showsVerticalScrollIndicator = NO;
    UIPageControl *pageControl = [UIPageControl new];//添加页数控制图
    pageControl.tag = 1000;
    
    [self.view addSubview:pageControl];
    
    pageControl.frame = CGRectMake(0, self.view.frame.size.height - 60, self.view.frame.size.width, 30);
    pageControl.numberOfPages = welcomeImageName.count;
    pageControl.currentPageIndicatorTintColor = [UIColor lightGrayColor];
    pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    pageControl.userInteractionEnabled = NO;//关闭分页空间的用户交互功能
    welcomeScrollview.delegate = self;
    
    UIButton *startButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [startButton setTitle:@"点击进入" forState:UIControlStateNormal];
    
    [welcomeScrollview addSubview:startButton];
    startButton.frame = self.view.frame;
    startButton.center = CGPointMake((welcomeImageName.count - 0.5) * welcomeScrollview.frame.size.width, welcomeScrollview.frame.size.height - 100);
    [startButton addTarget:self action:@selector(clickLogin) forControlEvents:UIControlEventTouchUpInside];
    startButton.backgroundColor = [UIColor clearColor];
    startButton.tintColor = [UIColor blackColor];
}

-(void)clickLogin
{
    UITabBarController *tab = [UITabBarController new];
    
    TFQueryViewController *homePage = [TFQueryViewController new];
    UINavigationController *homePageNavi = [[UINavigationController alloc]initWithRootViewController:homePage];
    
    TFPersonalCenterViewController *personCenter = [TFPersonalCenterViewController new];
    UINavigationController *personCenterNavi = [[UINavigationController alloc]initWithRootViewController:personCenter];
    
    TFMyTripViewController *myTrip = [TFMyTripViewController new];
    UINavigationController *myTripNavi = [[UINavigationController alloc]initWithRootViewController:myTrip];
    
    TFTrainServiceViewController *trainService = [TFTrainServiceViewController new];
    UINavigationController *trainServiceNavi = [[UINavigationController alloc]initWithRootViewController:trainService];
    
    tab.viewControllers = @[homePageNavi,myTripNavi,trainServiceNavi,personCenterNavi];
    [self presentViewController:tab animated:YES completion:nil];
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def setBool:YES forKey:@"en"];
}

//滚动试图发生位移，进入下方代理
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint point = scrollView.contentOffset;
    UIPageControl *otherPageControl = (UIPageControl *)[self.view viewWithTag:1000];
    NSInteger index = round(point.x / scrollView.frame.size.width);
    
    otherPageControl.currentPage = index;
}


//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    
//    NSArray * welcomeImageName = @[@"welcome_1",@"welcome_2",@"welcome_3",@"welcome_4"];
//    for (int i = 0; i < welcomeImageName.count; i++)
//    {
//        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:welcomeImageName[i]]];
//        imageView.frame = CGRectMake(self.view.bounds.size.width * i, 0, self.view.bounds.size.width, self.view.bounds.size.height);
//        [_scrollView addSubview:imageView];
//        
//        //当循环到最后一张图片时，为这张图片添加点击时间
//        if (i == welcomeImageName.count - 1)
//        {
//            UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
//            [imageView addGestureRecognizer:tapGR];
//            imageView.userInteractionEnabled = YES;
//        }
//    }
//    //设置滚动区域大小
//    _scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * welcomeImageName.count, 0);
//    _pageControl.numberOfPages = welcomeImageName.count;
//}
//
//-(void)tap:(UIGestureRecognizer *)gr
//{
//    /*
//     欢迎页面是window的根视图控制器，跳转操作实际上是替换了window的根视图控制器
//    [UIApplication sharedApplication]可以在任意代码位置，获得当前appdelegate在内存中的额对象指针
//    makekeyAndVisible,代表把 window变为keyWindow并且可视
//    [UIApplication sharedApplication].keyWindow.rootViewController = vc;
//    还可以直接获取去当前view的窗口
//     */
//    id vc = [self.storyboard instantiateViewControllerWithIdentifier:@"TabbarController"];
//    self.view.window.rootViewController = vc;
//}
//
////监视滚动试图的滚动时间，计算当前页数，改变页数控制器
//-(void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    NSInteger pageIndex = lrint(scrollView.contentOffset.x / scrollView.frame.size.width);
//    _pageControl.currentPage = pageIndex;
//}


@end


