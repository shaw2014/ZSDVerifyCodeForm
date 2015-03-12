//
//  ViewController.m
//  demo
//
//  Created by zhaoxiao on 15/3/12.
//  Copyright (c) 2015年 shaw. All rights reserved.
//

#import "ViewController.h"
#import "VerifyCodeView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet VerifyCodeView *verifyCodeView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor grayColor];
    _verifyCodeView.verifyCodeKey = NSStringFromClass(self.class);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
