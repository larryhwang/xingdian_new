//
//  HttpTool.m
//  xingdian
//
//  Created by FengHua on 3/24/16.
//  Copyright © 2016 PeaK Points Tec Co.,Ltd. All rights reserved.
//

#import "HttpTool.h"
#import <AFNetworking/AFHTTPRequestOperationManager.h>

@implementation HttpTool


+(void)doLogoinRequsestWithDic:(NSDictionary *)pramaDic andLoginUI:(UIViewController *)LoinVC{

    [MHNetworkManager postReqeustWithURL:[NSString stringWithFormat:@"%@/Api/User/Login",BasicUrl] params:pramaDic successBlock:^(NSDictionary *returnData) {
        XDLog(@"%@",returnData);
        XDLog(@"登陆通知");
        [LoinVC dismissViewControllerAnimated:YES completion:nil];
        [NS_NOTIFICATION_CENTER postNotificationName:nLoginNotifyCation object:nil];
    } failureBlock:^(NSError *error) {
        XDLog(@"%@",error);
    } showHUD:YES];
}











@end
