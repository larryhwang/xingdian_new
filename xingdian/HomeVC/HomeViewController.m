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

- (void)viewDidLoad {
    [super viewDidLoad];
    [self UISetUp];


}



-(void)UISetUp {
    [self initMap];
    [self initLeftMenu];
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
    [self.view addSubview:_sideSlipView];
}

-(void)initNav {
    
}

@end
