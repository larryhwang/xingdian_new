//
//  HttpTool.m
//  xingdian
//
//  Created by FengHua on 3/24/16.
//  Copyright © 2016 PeaK Points Tec Co.,Ltd. All rights reserved.
//

#import "HttpTool.h"

#import "UserInfoModel.h"
#import "MJExtension.h"

@implementation HttpTool


+(void)doLogoinRequsestWithDic:(NSDictionary *)pramaDic andLoginUI:(UIViewController *)LoinVC{

    [MHNetworkManager postReqeustWithURL:[NSString stringWithFormat:@"%@/Api/User/Login",BasicUrl] params:pramaDic successBlock:^(NSDictionary *returnData) {
        XDLog(@"%@",returnData);
        [[NSUserDefaults standardUserDefaults] setObject:returnData[@"AccessToken"] forKey:@"APIToken"];
        UserInfoModel *user = [UserInfoModel mj_objectWithKeyValues:returnData[@"Item"]];
        [LoinVC dismissViewControllerAnimated:YES completion:nil];
        [NS_NOTIFICATION_CENTER postNotificationName:nLoginNotifyCation object:user];
    } failureBlock:^(NSError *error) {
        XDLog(@"%@",error);
    } showHUD:YES];
}











@end
