//
//  HomeViewController.m
//  xingdian
//
//  Created by FengHua on 3/23/16.
//  Copyright © 2016 PeaK Points Tec Co.,Ltd. All rights reserved.
//

#import "HomeViewController.h"
#import <MAMapKit/MAMapKit.h>
#include "UIViewController+RESideMenu.h"
#import "LoginViewController.h"

@interface HomeViewController () {
    MAMapView *_mapView;
}

@end

@implementation HomeViewController


-(void)viewDidAppear:(BOOL)animated {

}


- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor = [UIColor whiteColor];
    
  //  MAUserLocation *dd = [];

    
    [self UISetUp];
    LoginViewController *Login  = [LoginViewController new];
    [self presentViewController:Login animated:YES completion:nil];
    
    
    


}



-(void)UISetUp {
    [self initMap];
    [self initNav];

}


-(void)initMap{
    _mapView                   = [[MAMapView alloc]initWithFrame:self.view.bounds];
    _mapView.showsUserLocation = YES;
    _mapView.userTrackingMode  = 1;
    [self.view addSubview:_mapView];

}




-(void)initNav {
    
    [self.navigationController.navigationBar setBackgroundImage:[self createImageWithColor:NavTabbarColor] forBarMetrics:UIBarMetricsDefault];
    UIButton *MenuBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 26, 18)];
    UILabel *Tiitle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 85, 26)];
    Tiitle.backgroundColor = [UIColor redColor];
    Tiitle.text = @" 星点测试";
    [Tiitle setTextColor:[UIColor whiteColor]];
    
    [MenuBtn setBackgroundImage:[UIImage imageNamed:@"navigation_icon@3x"]  forState:UIControlStateNormal];
    [MenuBtn addTarget:self action:@selector(presentLeftMenuViewController:) forControlEvents:UIControlEventTouchUpInside];
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
