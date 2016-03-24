//
//  UserInfoModel.h
//  XingDian
//
//  Created by _author on 16-03-24.
//  Copyright (c) _companyname. All rights reserved.
//

/*
	
*/


#import <Foundation/Foundation.h>
#import "DTApiBaseBean.h"


@interface UserInfoModel : NSObject
{
	NSString *_LoginName;
	NSString *_SP_Addr;
	NSString *_SP_Contact;
	NSString *_SP_Phone;
	NSString *_SP_Username;
	NSString *_UserName;
}


@property (nonatomic, copy) NSString *LoginName;
@property (nonatomic, copy) NSString *SP_Addr;
@property (nonatomic, copy) NSString *SP_Contact;
@property (nonatomic, copy) NSString *SP_Phone;
@property (nonatomic, copy) NSString *SP_Username;
@property (nonatomic, copy) NSString *UserName;

-(id)initWithDictionary:(NSDictionary*)dict;
-(NSDictionary*)dictionaryValue;
@end
 