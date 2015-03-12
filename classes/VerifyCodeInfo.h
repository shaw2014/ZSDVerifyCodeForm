//
//  VerifyCodeInfo.h
//  Qian100
//
//  Created by zhaoxiao on 14/12/27.
//  Copyright (c) 2014年 ZOSENDA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VerifyCodeInfo : NSObject

@property (nonatomic,strong) NSMutableDictionary *getCodeDic;

+(VerifyCodeInfo *)shareInstance;

@end
