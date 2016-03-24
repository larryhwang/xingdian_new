//
//  YCLeftViewController.m
//  YCW
//
//  Created by apple on 15/12/17.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#define ICOVIEW_HEIGHT 60

#import "YCLeftViewController.h"
#import <Masonry/Masonry.h>

static NSString * const kYCLeftViewControllerCellReuseId = @"kYCLeftViewControllerCellReuseId";

@interface YCLeftViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *lefs;
@property (nonatomic, assign) NSInteger previousRow;



@end

@implementation YCLeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [NS_NOTIFICATION_CENTER addObserver:self selector:@selector(UpdateUserInfo) name:nLoginNotifyCation object:nil];
    

    
    
    
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *headContentViwe = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 3.5 * NAV_TAB_BAR_HEIGHT)];
    headContentViwe.backgroundColor = NavTabbarColor;
   [self.view addSubview:headContentViwe];

    UIImageView *IconView = [UIImageView new];
    IconView.backgroundColor = [UIColor yellowColor];
       IconView.layer.masksToBounds = YES;     //这样的话才可以显示圆角
      IconView.layer.cornerRadius = ICOVIEW_HEIGHT/2 ;
    [headContentViwe addSubview:IconView];
    [IconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leadingMargin.equalTo(headContentViwe).mas_offset(30);
        make.topMargin.equalTo(headContentViwe).mas_offset(40 + STATUS_BAR_HEIGHT);
        make.size.mas_equalTo(CGSizeMake(ICOVIEW_HEIGHT, ICOVIEW_HEIGHT));
    }];

    _lefs = @[@"服务商信息", @"服务条款", @"使用说明", @"用户反馈", @"关于我们"];
    _tableView = [[UITableView alloc] init];
    _tableView.frame = CGRectMake(0, 4*NAV_TAB_BAR_HEIGHT + 10 , self.view.frame.size.width, self.view.frame.size.width - 64);
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
- (UIImage*)createImageWithColor: (UIColor*) color
{
    CGRect rect=CGRectMake(0,0, 49 , 49);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

-(void)UpdateUserInfo {
    XDLog(@"更新头像信息");
}

@end
