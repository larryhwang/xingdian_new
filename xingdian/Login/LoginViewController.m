//
//  LoginViewController.m
//  xingdian
//
//  Created by FengHua on 3/24/16.
//  Copyright © 2016 PeaK Points Tec Co.,Ltd. All rights reserved.
//

#import "LoginViewController.h"



@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)LoginBtnClick:(id)sender {
    //网络处理
    NSDictionary *dic = @{@"Name":@"xiaofu",@"Pass":@"123456"};
    [HttpTool doLogoinRequsestWithDic:dic andLoginUI:self];
   
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

@end
