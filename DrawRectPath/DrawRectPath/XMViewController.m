//
//  XMViewController.m
//  DrawRectPath
//
//  Created by jack on 14-8-11.
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
    
    XMPathView * pathView = [[XMPathView alloc] initWithFrame:CGRectMake(20.0, 50.0, 100.0, 100.0)];
    pathView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:pathView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
