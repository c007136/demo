//
//  XMViewController.m
//  Circular_Learn
//
//  Created by jack on 14-7-1.
//  Copyright (c) 2014年 com.yuzhuangbao.xiaomi. All rights reserved.
//

#import "XMViewController.h"
#import "XMCircularView.h"

@interface XMViewController ()

@end

@implementation XMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    XMCircularView * circularView = [[XMCircularView alloc] initWithFrame:CGRectMake((320-177)/2., 100, 177, 177)];
    [circularView setPercent:75 animated:YES];
    [self.view addSubview:circularView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
