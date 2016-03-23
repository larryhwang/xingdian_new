//
//  HomeViewController.m
//  xingdian
//
//  Created by FengHua on 3/23/16.
//  Copyright © 2016 PeaK Points Tec Co.,Ltd. All rights reserved.
//

#import "HomeViewController.h"
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
    [self initNav];
    self.view.backgroundColor = [UIColor whiteColor];
//    [self UISetUp];
//    
//            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
//

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

    
}

//UIBarMetricsDefault,
//UIBarMetricsCompact,
//UIBarMetricsDefaultPrompt = 101, // Applicable only in bars with the prompt property, such as UINavigationBar and UISearchBar
//UIBarMetricsCompactPrompt,

-(void)initNav {
    
    [self.navigationController.navigationBar setBackgroundImage:[self createImageWithColor:NavTabbarColor] forBarMetrics:UIBarMetricsDefault];
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navigation_icon@3x"]  style:UIBarButtonItemStylePlain target:self action:@selector(presentLeftMenuViewController:)];
    
    UIButton *MenuBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 35, 26)];
    UILabel *Tiitle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 60, 26)];
    Tiitle.text = @"星点测试";
    [Tiitle setTextColor:[UIColor whiteColor]];
    
    [MenuBtn setBackgroundImage:[UIImage imageNamed:@"navigation_icon@3x"]  forState:UIControlStateNormal];
    [MenuBtn addTarget:self action:@selector(presentLeftMenuViewController:) forControlEvents:UIControlEventTouchDragInside];
    self.navigationItem.leftBarButtonItems = @[[[UIBarButtonItem alloc]initWithCustomView:MenuBtn],[[UIBarButtonItem alloc]initWithCustomView:Tiitle]];
    
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


-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
@end
