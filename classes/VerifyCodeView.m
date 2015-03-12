//
//  VerifyCodeView.m
//  demo
//
//  Created by zhaoxiao on 15/2/12.
//  Copyright (c) 2015年 zhaoxiao. All rights reserved.
//----------------验证码输入框------------------

#import "VerifyCodeView.h"
#import "VerifyCodeForm.h"

@implementation VerifyCodeView

-(NSString *)nibName
{
    return @"VerifyCodeForm";
}

-(void)setVerifyCodeKey:(NSString *)verifyCodeKey
{
    if(_verifyCodeKey != verifyCodeKey)
    {
        _verifyCodeKey = verifyCodeKey;
        
        VerifyCodeForm *verifyCode = (VerifyCodeForm *)self.nibView;
        verifyCode.verifyCodeKey = _verifyCodeKey;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
