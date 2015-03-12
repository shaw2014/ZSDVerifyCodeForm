//
//  VerifyCodeInfo.m
//  Qian100
//
//  Created by zhaoxiao on 14/12/27.
//  Copyright (c) 2014年 ZOSENDA. All rights reserved.
//

#import "VerifyCodeInfo.h"

@implementation VerifyCodeInfo

+(VerifyCodeInfo *)shareInstance
{
    static VerifyCodeInfo *verifyInfo;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        verifyInfo = [[VerifyCodeInfo alloc]init];
    });
    
    return verifyInfo;
}

-(NSMutableDictionary *)getCodeDic
{
    if(!_getCodeDic)
    {
        _getCodeDic = [[NSMutableDictionary alloc]init];
    }
    
    return _getCodeDic;
}

@end
