//
//  BaseModuleView.m
//  demo
//
//  Created by zhaoxiao on 15/2/11.
//  Copyright (c) 2015年 zhaoxiao. All rights reserved.
//---------------组件基类-----------------

#import "BaseModuleView.h"

@implementation BaseModuleView

-(void)awakeFromNib
{
    [super awakeFromNib];
    
    [self loadNib];
}

-(NSString *)nibName
{
    return nil;
}

-(void)loadNib
{
    NSString *nibName = [self nibName];
    if(nibName)
    {
        UIView *nibView = [[[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil] objectAtIndex:0];
        self.nibView = nibView;
        [self addSubview:nibView];
        nibView.translatesAutoresizingMaskIntoConstraints = NO;
        
        NSArray *nibView_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[nibView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(nibView)];
        NSArray *nibView_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[nibView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(nibView)];
        [self addConstraints:nibView_H];
        [self addConstraints:nibView_V];
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
