//
//  XMViewController.m
//  GCD_Learn
//
//  Created by jack on 14-9-8.
//  Copyright (c) 2014年 com.yuzhuangbao.xiaomi. All rights reserved.
//

#import "XMViewController.h"
#import "XMDetailViewController.h"

@interface XMViewController ()

@end

@implementation XMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *  button = [[UIButton alloc] initWithFrame:CGRectMake(50, 100, 100, 30)];
    button.backgroundColor = [UIColor orangeColor];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(void)buttonClick
{
    XMDetailViewController * dvc = [[XMDetailViewController alloc] init];
    [self.navigationController pushViewController:dvc animated:YES];
}


@end
