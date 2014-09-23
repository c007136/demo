//
//  XMViewController.m
//  UIButton_Custom_Learn
//
//  Created by jack on 14-8-29.
//  Copyright (c) 2014年 com.yuzhuangbao.xiaomi. All rights reserved.
//

#import "XMViewController.h"
#import "XMExtraButton.h"

@interface XMViewController ()

@end

@implementation XMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect rect = CGRectMake(50, 50, 100, 30);
    
    CGRect viewframe = CGRectInset(rect, -10, -10);
    UIView * view = [[UIView alloc] initWithFrame:viewframe];
    view.backgroundColor = [UIColor brownColor];
    [self.view addSubview:view];

    XMExtraButton * button = [XMExtraButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(50, 50, 100, 30);
    [button.layer setMasksToBounds:YES];
    [button.layer setCornerRadius:2.0f];
    [button setBackgroundImage:[UIImage imageNamed:@"helight.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonClick
{
    NSLog(@".............***********>>>");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
