//
//  UserInfoModel.m
//  XingDian
//
//  Created by _author on 16-03-24.
//  Copyright (c) _companyname. All rights reserved.
//  

/*
	
*/


#import "UserInfoModel.h"
#import "DTApiBaseBean.h"


@implementation UserInfoModel

@synthesize LoginName = _LoginName;
@synthesize SP_Addr = _SP_Addr;
@synthesize SP_Contact = _SP_Contact;
@synthesize SP_Phone = _SP_Phone;
@synthesize SP_Username = _SP_Username;
@synthesize UserName = _UserName;


-(id)initWithDictionary:(NSDictionary*)dict
{
    if (self = [super init])
    {
		DTAPI_DICT_ASSIGN_STRING(LoginName, @"");
		DTAPI_DICT_ASSIGN_STRING(SP_Addr, @"");
		DTAPI_DICT_ASSIGN_STRING(SP_Contact, @"");
		DTAPI_DICT_ASSIGN_STRING(SP_Phone, @"");
		DTAPI_DICT_ASSIGN_STRING(SP_Username, @"");
		DTAPI_DICT_ASSIGN_STRING(UserName, @"");
    }
    
    return self;
}

-(NSDictionary*)dictionaryValue
{
    NSMutableDictionary *md = [NSMutableDictionary dictionary];
    
	DTAPI_DICT_EXPORT_BASICTYPE(LoginName);
	DTAPI_DICT_EXPORT_BASICTYPE(SP_Addr);
	DTAPI_DICT_EXPORT_BASICTYPE(SP_Contact);
	DTAPI_DICT_EXPORT_BASICTYPE(SP_Phone);
	DTAPI_DICT_EXPORT_BASICTYPE(SP_Username);
	DTAPI_DICT_EXPORT_BASICTYPE(UserName);
    return md;
}
@end
