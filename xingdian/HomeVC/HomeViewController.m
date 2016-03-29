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
#import "CustomAnnotationView.h"





@interface HomeViewController ()<MAMapViewDelegate> {
    MAMapView *_mapView;
}

@property (nonatomic, strong) NSMutableArray *annotas;
@property (nonatomic, strong) NSMutableArray *popViews;
@property (nonatomic, strong) MAUserLocation *CurrentLocation;

@end

@implementation HomeViewController


-(NSMutableArray *)annotas {
    if (!_annotas) {
        _annotas = [NSMutableArray new];
    }
    return _annotas;
}


-(NSMutableArray *)popViews {
    if (!_popViews) {
        _popViews = [NSMutableArray new];
    }
    return _popViews;
}

-(void)viewDidAppear:(BOOL)animated {
    /* Add a annotation on map center. */
    
//    [self addAnnotationWithCooordinate:];
    

}


- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor = [UIColor whiteColor];
    [self UISetUp];
     LoginViewController *Login  = [LoginViewController new];
  //  [self presentViewController:Login animated:YES completion:nil];
    


    CLLocationCoordinate2D coordinates[4];  //定位点
    //惠南点  22.993399  114.488573
   coordinates[0] = CLLocationCoordinate2DMake(22.993400, 114.488586);
   coordinates[1] = CLLocationCoordinate2DMake(22.997800, 114.489286);
   coordinates[2] = CLLocationCoordinate2DMake(22.967800, 114.479286);
   NSLog(@"%f",coordinates[0].latitude);
    
   [self addAnnotationWithCooordinate:coordinates[0]];
   [self addAnnotationWithCooordinate:coordinates[1]];
   [self addAnnotationWithCooordinate:coordinates[2]];
    
    
      NSLog(@"%@",self.annotas);
  //    [_mapView showAnnotations:self.annotas animated:YES];
    
    [_mapView setCenterCoordinate:coordinates[0] animated:YES];

    
       [_mapView setZoomLevel:17];   //17为比较合适

}



-(void)UISetUp {
    [self initMap];
    [self initNav];
    [self initFuncBtns];
 

}


-(void)initMap{
    _mapView                   = [[MAMapView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _mapView.showsLabels       = YES;
    _mapView.scaleOrigin       = CGPointMake(5.f,  (SCREEN_HEIGHT * 1.f)-45.f);
    _mapView.showsUserLocation = YES;
    _mapView.userTrackingMode  = 1;
    _mapView.delegate          = self;
    [self.view addSubview:_mapView];

}


-(void)initNav {
    UIButton *MenuBtn      = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 26, 18)];
    UILabel *Tiitle        = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 85, 26)];
    Tiitle.backgroundColor = [UIColor redColor];
    Tiitle.text            =   NSLocalizedString(@"星点测试",nil);      //MyLocal(@"登录");//;MyLocal(@"登录")
    [self.navigationController.navigationBar setBackgroundImage:[self createImageWithColor:NavTabbarColor] forBarMetrics:UIBarMetricsDefault];
    [Tiitle setTextColor:[UIColor whiteColor]];
    [MenuBtn setBackgroundImage:[UIImage imageNamed:@"navigation_icon@3x"]  forState:UIControlStateNormal];
    [MenuBtn addTarget:self action:@selector(presentLeftMenuViewController:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItems = @[[[UIBarButtonItem alloc]initWithCustomView:MenuBtn],[[UIBarButtonItem alloc]initWithCustomView:Tiitle]];
    
 //   UIButton *MenuBtn      = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 26, 18)];
    
    
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

-(void)addAnnotationWithCooordinate:(CLLocationCoordinate2D)coordinate
{
    MAPointAnnotation *annotation = [[MAPointAnnotation alloc] init];
    annotation.coordinate = coordinate;
    annotation.title    = @"AutoNavi";
    annotation.subtitle = @"CustomAnnotationView";
    
    
    
    
    [self.annotas addObject:annotation];
    
      NSLog(@"%@",self.annotas);
    
    [_mapView addAnnotation:annotation];
}


-(MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation {

    
    
    NSLog(@"%f",annotation.coordinate.latitude);
    
    //大头针显示的位置
    if ([annotation isKindOfClass:[MAPointAnnotation class]])
    {
        static NSString *customReuseIndetifier = @"customReuseIndetifier";
        
        CustomAnnotationView *annotationView = (CustomAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:customReuseIndetifier];
        
        annotationView.canShowCallout = NO;
        
        if (annotationView == nil)
        {
            annotationView = [[CustomAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:customReuseIndetifier];
            // must set to NO, so we can show the custom callout view.
            annotationView.canShowCallout = NO;
            annotationView.draggable = YES;
            annotationView.calloutOffset = CGPointMake(0, -5);
        }
        
        annotationView.portrait = [UIImage imageNamed:@"hema.png"];
        annotationView.name     = @"河马";
        [self.popViews addObject:annotationView];  //气泡数组
        [self update];
        return annotationView;
    }
    
    return nil;
    
}

- (void)mapViewDidStopLocatingUser:(MAMapView *)mapView; {
    
}


- (void)mapView:(MAMapView *)mapView mapDidZoomByUser:(BOOL)wasUserAction; {
      NSLog(@"缩放:%f",mapView.zoomLevel);
}




-(void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation
updatingLocation:(BOOL)updatingLocation
{
    if(updatingLocation)
    {
        //取出当前位置的坐标
        NSLog(@"latitude : %f,longitude: %f",userLocation.coordinate.latitude,userLocation.coordinate.longitude);
        self.CurrentLocation  = userLocation;
    }
}


-(void)initFuncBtns {
    //人的位置
    UIButton *showUserLoc = [[UIButton alloc]initWithFrame:CGRectMake(10, SCREEN_HEIGHT-133 , 25, 25)];
    showUserLoc.backgroundColor = [UIColor redColor];
    [showUserLoc addTarget:self action:@selector(showWhereIam) forControlEvents:UIControlEventTouchUpInside];
    [_mapView addSubview:showUserLoc];
    
    //左切换车
    UIButton *LeftChoseCar = [UIButton new];
    [_mapView addSubview:LeftChoseCar];
    [LeftChoseCar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(25, 25));   //设置大小
        make.centerY.mas_equalTo(_mapView.mas_centerY);    // 设置其位于父视图的Y的中心位置
        make.left.mas_equalTo(_mapView).with.offset(0);    //左边相对右边是0距离
    }];
    LeftChoseCar.backgroundColor = [UIColor brownColor];
    
    [LeftChoseCar addTarget:self action:@selector(SwicthCar) forControlEvents:UIControlEventTouchUpInside];

    
    
    //右切换车
    UIButton *RightChoseCar = [UIButton new];
    [_mapView addSubview:RightChoseCar];
    [RightChoseCar mas_makeConstraints:^(MASConstraintMaker *make) {
       make.size.mas_equalTo(CGSizeMake(25, 25));   //设置大小
       make.centerY.mas_equalTo(_mapView.mas_centerY);    // 设置其位于父视图的Y的中心位置
        make.right.mas_equalTo(_mapView).with.offset(0);
    }];
                               
    RightChoseCar.backgroundColor = [UIColor brownColor];
    [RightChoseCar addTarget:self action:@selector(SwicthCar) forControlEvents:UIControlEventTouchUpInside];
    [_mapView addSubview:RightChoseCar];
}


-(void)showWhereIam {
    [_mapView setCenterCoordinate:self.CurrentLocation.location.coordinate animated:YES];
}

-(void)SwicthCar {
    //链表指针 ?
       [self.popViews[0] setSelected:NO animated:YES];  //一进来就弹窗一个
    [self.popViews[2] setSelected:YES animated:YES];
}

/**
 *  测试 ,先弹出一个气泡
 */
-(void)update{
       [self.popViews[0] setSelected:YES animated:YES];  //一进来就弹窗一个
}

@end
