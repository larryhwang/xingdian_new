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
#import "UserInfoModel.h"

static NSString * const kYCLeftViewControllerCellReuseId = @"kYCLeftViewControllerCellReuseId";

@interface YCLeftViewController ()<UITableViewDataSource, UITableViewDelegate> {
    NSString *_loginName;
    NSString *_userName;
}

@property (nonatomic, strong) NSArray   *lefs;
@property (nonatomic, assign) NSInteger previousRow;

@property (nonatomic, strong) UILabel   *LoginNameLab;
@property (nonatomic, strong) UILabel   *UserNameLab;
@property (nonatomic, strong) UIView    *HeadContentView;
@property (nonatomic, strong) UIImageView    *IcoView;

@end

@implementation YCLeftViewController


-(UILabel *)LoginNameLab {
    if (!_LoginNameLab) {
        _LoginNameLab                    = [UILabel new];
        [self.HeadContentView addSubview:_LoginNameLab];
    }
    return _LoginNameLab;
}




-(UILabel *)UserNameLab {
    if (!_UserNameLab) {
        _UserNameLab                     = [UILabel new];
        _UserNameLab.backgroundColor     = [UIColor redColor];
        _UserNameLab.backgroundColor     = [UIColor redColor];
        [self.HeadContentView addSubview:_UserNameLab];
    }
    return _UserNameLab;
}

-(UIView *)HeadContentView{
    if (!_HeadContentView) {
        _HeadContentView                 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 3.5 * NAV_TAB_BAR_HEIGHT)];
        _HeadContentView.backgroundColor = NavTabbarColor;
        [self.view addSubview:_HeadContentView];
    }
    return _HeadContentView;
}

-(UIImageView *)IcoView {
    if (!_IcoView) {
        _IcoView           = [UIImageView new];
        _IcoView.backgroundColor     = [UIColor yellowColor];
        _IcoView.layer.masksToBounds = YES;
        _IcoView.layer.cornerRadius      = ICOVIEW_HEIGHT/2 ;
        [self.HeadContentView addSubview:_IcoView];
    }
    return _IcoView;
}



- (void)viewDidLoad {
    [super viewDidLoad];

    [NS_NOTIFICATION_CENTER addObserver:self selector:@selector(UpdateUserInfo:) name:nLoginNotifyCation object:nil];
    self.view.backgroundColor      = [UIColor whiteColor];
    
    _lefs                          = @[@"服务商信息", @"服务条款", @"使用说明", @"用户反馈", @"关于我们"];
    _tableView                     = [[UITableView alloc] init];
    _tableView.frame               = CGRectMake(0, 4*NAV_TAB_BAR_HEIGHT + 10 , self.view.frame.size.width, self.view.frame.size.width - 64);
    _tableView.dataSource          = self;
    _tableView.delegate            = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kYCLeftViewControllerCellReuseId];
    self.tableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.tableView];
}



-(void)headViewSet {
    self.UserNameLab.text = @"得到的";
    self.LoginNameLab.text = @"这是这是用户名哟";
    [self.IcoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leadingMargin.equalTo(self.HeadContentView).mas_offset(30);
        make.topMargin.equalTo(self.HeadContentView).mas_offset(40 + STATUS_BAR_HEIGHT);
        make.size.mas_equalTo(CGSizeMake(ICOVIEW_HEIGHT, ICOVIEW_HEIGHT));
    }];
    
    if ([self isLoginNameTaller]) {         //登陆名更长
        [self.LoginNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.IcoView.mas_right).mas_offset(10);
            make.top.equalTo(self.IcoView.mas_centerY).mas_offset(0);
        }];
        
        [self.UserNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.LoginNameLab.mas_centerX).mas_offset(0);
            make.bottom.equalTo(self.IcoView.mas_centerY).mas_offset(0);
        }];
    } else { //用户名更长
        [self.UserNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.IcoView.mas_right).mas_offset(10);
            make.bottom.equalTo(self.IcoView.mas_centerY).mas_offset(0);
        }];
        
        [self.LoginNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.UserNameLab.mas_centerX).mas_offset(0);
            make.top.equalTo(self.IcoView.mas_centerY).mas_offset(10);
        }];
    }
    





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
    CGRect rect          = CGRectMake(0,0, 49 , 49);
    UIImage *theImage    = UIGraphicsGetImageFromCurrentImageContext();
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIGraphicsBeginImageContext(rect.size);
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);

    UIGraphicsEndImageContext();
    return theImage;
}


-(void)UpdateUserInfo:(NSNotification *)notify {
    XDLog(@"更新");
    self.UserNameLab.text  = @"这是用户名哟";
    self.LoginNameLab.text = @"这是用户名哟淡淡的";
    UserInfoModel *user    = notify.object;


    
    [self headViewSet];
    NSLog(@"更新名字:%@",user.LoginName);
}

-(BOOL)isLoginNameTaller {
   // if ([_loginName length] > [_userName length]) {
    if ( [self.LoginNameLab.text length] > [self.UserNameLab.text length]) {

        return YES;
    } else {
        return NO;
    }
}

@end
