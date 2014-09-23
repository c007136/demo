//
//  XMViewController.m
//  Notification_Learn
//
//  Created by jack on 14-8-22.
//  Copyright (c) 2014年 com.yuzhuangbao.xiaomi. All rights reserved.
//

#import "XMViewController.h"
#import "XMObsever.h"

@interface XMViewController ()
{
    XMObsever            * _obsever;
}

@end

@implementation XMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 100, 30)];
    button.backgroundColor = [UIColor orangeColor];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    _obsever = [[XMObsever alloc] init];
}

- (void)buttonClick
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"postmessage" object:nil];
}

@end
