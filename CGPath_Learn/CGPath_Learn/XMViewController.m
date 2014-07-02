//
//  XMViewController.m
//  CGPath_Learn
//
//  Created by jack on 14-7-1.
//  Copyright (c) 2014年 com.yuzhuangbao.xiaomi. All rights reserved.
//

#import "XMViewController.h"
#import "XMPathView.h"

@interface XMViewController ()

@end

@implementation XMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    XMPathView * subView = [[XMPathView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:subView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
