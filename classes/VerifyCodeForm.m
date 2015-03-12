//
//  VerifyCodeForm.m
//  demo
//
//  Created by zhaoxiao on 15/2/12.
//  Copyright (c) 2015年 zhaoxiao. All rights reserved.
//

#import "VerifyCodeForm.h"
#import "VerifyCodeInfo.h"

#define kCountdownSeconds 120

@interface VerifyCodeForm ()<UITextFieldDelegate>
{
    NSTimer *countDownTimer;
    
    NSInteger remainSeconds;
}

@property (weak, nonatomic) IBOutlet UITextField *verifyCodeField;
@property (weak, nonatomic) IBOutlet UILabel *sendCodeLabel;

@property (nonatomic,assign) UIControlState status;

@end

@implementation VerifyCodeForm

-(void)awakeFromNib
{
    [super awakeFromNib];
    
    _verifyCodeField.delegate = self;
}

-(IBAction)sendCodeAction:(id)sender
{
    if(_status != UIControlStateDisabled)
    {
        self.status = UIControlStateDisabled;
    }
}

-(void)setStatus:(UIControlState)status
{
    _status = status;
    switch (status) {
        case UIControlStateNormal:
        {
            _sendCodeLabel.userInteractionEnabled = YES;
            
            _sendCodeLabel.text = @"获取验证码";
            _sendCodeLabel.textColor = [UIColor redColor];
            
            remainSeconds = kCountdownSeconds;
        }
            break;
        case UIControlStateDisabled:
        {
            _sendCodeLabel.userInteractionEnabled = NO;
            
            _sendCodeLabel.text = nil;
            _sendCodeLabel.textColor = [UIColor grayColor];
            [self startTimer];
            
            [self onTimer:nil];
        }
            break;
        case UIControlStateSelected:
        {
            _sendCodeLabel.userInteractionEnabled = YES;
            
            _sendCodeLabel.text = @"重新获取";
            _sendCodeLabel.textColor = [UIColor blueColor];
            
            remainSeconds = kCountdownSeconds;
        }
            break;
            
        default:
            break;
    }
}

-(void)setVerifyCodeKey:(NSString *)verifyCodeKey
{
    if(_verifyCodeKey != verifyCodeKey)
    {
        _verifyCodeKey = verifyCodeKey;
        
        if(_verifyCodeKey)
        {
            VerifyCodeInfo *verifyInfo = [VerifyCodeInfo shareInstance];
            if([verifyInfo.getCodeDic objectForKey:_verifyCodeKey])
            {
                NSDate *getDate = (NSDate *)[verifyInfo.getCodeDic objectForKey:_verifyCodeKey];
                NSTimeInterval timeInterval = [[NSDate date] timeIntervalSinceDate:getDate];
                if(timeInterval < kCountdownSeconds)
                {//不到规定时间时，不再重新发送验证码
                    remainSeconds = kCountdownSeconds - (int)timeInterval;
                    self.status = UIControlStateDisabled;
                    
                    [self startTimer];
                }
            }
            else
            {
                self.status = UIControlStateNormal;
            }
        }
    }
}

-(void)startTimer
{
    if(countDownTimer)
    {
        [self stopTimer];
    }
    
    //全局计时
    if(_verifyCodeKey)
    {
        [[VerifyCodeInfo shareInstance].getCodeDic setObject:[NSDate date] forKey:_verifyCodeKey];
    }
    
    countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(onTimer:) userInfo:nil repeats:YES];
}

-(void)onTimer:(NSTimer *)timer
{
    remainSeconds --;
    if(remainSeconds > 0)
    {
        NSString *str = [NSString stringWithFormat:@"%ld秒后重新获取",remainSeconds];
        NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc]initWithString:str];
        NSRange range = NSMakeRange(0, [NSString stringWithFormat:@"%ld",remainSeconds].length);
        [attStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:range];
        
        _sendCodeLabel.attributedText = attStr;
    }
    else
    {
        self.status = UIControlStateSelected;
        
        [self stopTimer];
    }
}

-(void)stopTimer
{
    [countDownTimer invalidate];
    countDownTimer = nil;
}

#pragma mark -UITextFieldDelegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return YES;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *text = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    if(text.length > 4)
    {
        return NO;
    }
    
    return YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
