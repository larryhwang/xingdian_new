//
//  HttpTool.h
//  xingdian
//
//  Created by FengHua on 3/24/16.
//  Copyright © 2016 PeaK Points Tec Co.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpTool : NSObject


+(void)doLogoinRequsestWithDic:(NSDictionary *)pramaDic andLoginUI:(UIViewController *)LoinVC;


+(void)doCarsMonitorRequsetWithDic:(NSDictionary *)parmDic ;

@end
