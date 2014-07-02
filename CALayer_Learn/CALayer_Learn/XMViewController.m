//
//  XMViewController.m
//  CALayer_Learn
//
//  Created by jack on 14-6-30.
//  Copyright (c) 2014年 com.yuzhuangbao.xiaomi. All rights reserved.
//

#import "XMViewController.h"

@interface XMViewController ()

@end

@implementation XMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIView * viewSample = [[UIView alloc] init];
    [self.view addSubview:viewSample];
    
    viewSample.backgroundColor = [UIColor greenColor];
    viewSample.frame = CGRectMake(50, 50, 200, 200);
    
    viewSample.layer.shadowPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 200, 200)].CGPath;
    viewSample.layer.masksToBounds = NO;
    viewSample.layer.shadowOffset = CGSizeMake(10, 10);
    viewSample.layer.shadowRadius = 5;
    viewSample.layer.shadowOpacity = 0.5;
    
    viewSample.layer.borderWidth = 2;
    viewSample.layer.borderColor = [[UIColor redColor] CGColor];
    
    viewSample.layer.opacity = 0.5;
    viewSample.layer.cornerRadius = 5;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
