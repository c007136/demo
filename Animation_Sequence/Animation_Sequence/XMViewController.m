//
//  XMViewController.m
//  Animation_Sequence
//
//  Created by jack on 14-7-2.
//  Copyright (c) 2014年 com.yuzhuangbao.xiaomi. All rights reserved.
//

#import "XMViewController.h"
#import "XMIconsView.h"

@interface XMViewController ()

@end

@implementation XMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    XMIconsView * iconsView = [[XMIconsView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-100, 320, 100)];
    iconsView.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:iconsView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
