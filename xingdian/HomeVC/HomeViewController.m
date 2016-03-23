//
//  HomeViewController.m
//  xingdian
//
//  Created by FengHua on 3/23/16.
//  Copyright © 2016 PeaK Points Tec Co.,Ltd. All rights reserved.
//

#import "HomeViewController.h"
#import "MenuView.h"
#import <MAMapKit/MAMapKit.h>
@interface HomeViewController () {
    MAMapView *_mapView;
}

@end

@implementation HomeViewController


-(void)viewDidAppear:(BOOL)animated {

}


- (void)viewDidLoad {
    [super viewDidLoad];

    [self UISetUp];
    
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];


}



-(void)UISetUp {
    [self initMap];
    [self initLeftMenu];
   // [self initNav];
}


-(void)initMap{
    _mapView                   = [[MAMapView alloc]initWithFrame:self.view.bounds];
    _mapView.showsUserLocation = YES;
    _mapView.userTrackingMode  = 1;
    [self.view addSubview:_mapView];

}


-(void)initLeftMenu {
    _sideSlipView = [[JKSideSlipView alloc]initWithSender:self];
    _sideSlipView.backgroundColor = [UIColor redColor];
    
    
    MenuView *menu = [MenuView menuView];
    [menu didSelectRowAtIndexPath:^(id cell, NSIndexPath *indexPath) {
        NSLog(@"click");
        [_sideSlipView hide];
        
    }];
    menu.items = @[@{@"title":@"1",@"imagename":@"1"},@{@"title":@"2",@"imagename":@"2"},@{@"title":@"3",@"imagename":@"3"},@{@"title":@"4",@"imagename":@"4"}];
    [_sideSlipView setContentView:menu];
    [self.navigationController.view addSubview:_sideSlipView];
}

//UIBarMetricsDefault,
//UIBarMetricsCompact,
//UIBarMetricsDefaultPrompt = 101, // Applicable only in bars with the prompt property, such as UINavigationBar and UISearchBar
//UIBarMetricsCompactPrompt,

-(void)initNav {
//    [self.navigationController.navigationBar setBackgroundImage:[self createImageWithColor:NavTabbarColor] forBarMetrics:UIBarMetricsDefault];
//    UIButton *LeftMenu = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 35, 35)];
//    [LeftMenu setBackgroundColor:[UIColor redColor]];
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:LeftMenu];
//    [LeftMenu addTarget:self action:@selector(showLeftMenu) forControlEvents:UIControlEventTouchUpInside];
  
//        self.navigationController.navigationBar.translucent = YES ;
//    self.navigationController.navigationBar.barTintColor = [NavTabbarColor colorWithAlphaComponent:0.5];
//    self.navigationController.navigationBar.alpha = 0.5 ;
//    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
//    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName, nil]];
//    self.navigationController.tabBarItem.title = @"消息";
    [[UIApplication sharedApplication] setStatusBarStyle : [self preferredStatusBarStyle]];
}


- (UIImage*)createImageWithColor: (UIColor*) color
{
    CGRect rect=CGRectMake(0,0, 45 , 45);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}


-(void)showLeftMenu  {
    [_sideSlipView switchMenu];
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
@end
