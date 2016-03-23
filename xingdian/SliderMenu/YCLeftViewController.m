//
//  YCLeftViewController.m
//  YCW
//
//  Created by apple on 15/12/17.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "YCLeftViewController.h"


static NSString * const kYCLeftViewControllerCellReuseId = @"kYCLeftViewControllerCellReuseId";

@interface YCLeftViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *lefs;
@property (nonatomic, assign) NSInteger previousRow;



@end

@implementation YCLeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    
    _lefs = @[@"首页", @"客服热线", @"用户反馈", @"软件设置", @"关于我们"];
    _tableView = [[UITableView alloc] init];
    _tableView.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.width - 64);
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kYCLeftViewControllerCellReuseId];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableView.backgroundColor = [UIColor clearColor];
//    self.tableView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:self.tableView];
}

//设置状态栏
- (BOOL)prefersStatusBarHidden
{
    return NO;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.lefs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kYCLeftViewControllerCellReuseId forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kYCLeftViewControllerCellReuseId];
    }
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.lefs[indexPath.row];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:20.0];
    cell.textLabel.textColor = [UIColor blackColor];
    cell.textLabel.highlightedTextColor = [UIColor grayColor];
    cell.selectedBackgroundView = [[UIView alloc] init];
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [tableView deselectRowAtIndexPath:indexPath animated:NO];
//    UIViewController *center;
//    if (indexPath.row == 0) {
//        center = self.sideMenuViewController.mainController;
//    }else if(indexPath.row == 1){
//        YCServiceViewController *service = [[YCServiceViewController alloc ] init];
//        center = [[UINavigationController alloc] initWithRootViewController:service];
//    }else if(indexPath.row == 2){
//        YCFeedbackViewController *feedback = [[YCFeedbackViewController alloc ] init];
//        center = [[UINavigationController alloc] initWithRootViewController:feedback];
//       
//    }else if(indexPath.row == 3){
//        YCSettingViewController *setting = [[YCSettingViewController alloc ] init];
//        center = [[UINavigationController alloc] initWithRootViewController:setting];
//    }else{
//        YCAboutViewController *about = [[YCAboutViewController alloc ] init];
//        center = [[UINavigationController alloc] initWithRootViewController:about];
//    }
//    [self.sideMenuViewController setContentViewController:center
//                                                 animated:YES];
//    [self.sideMenuViewController hideMenuViewController];
//    
//    self.previousRow = indexPath.row;

}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com