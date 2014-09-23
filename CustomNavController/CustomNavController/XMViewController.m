//
//  XMViewController.m
//  CustomNavController
//
//  Created by jack on 14-8-7.
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
	
    self.view.backgroundColor = [UIColor brownColor];
    
    UIButton * detailButton = [UIButton buttonWithType:UIButtonTypeCustom];
    detailButton.frame = CGRectMake(0, 0, 36, 36);
    [detailButton setImage:[UIImage imageNamed:@"navbar-left-item"] forState:UIControlStateNormal];
    [detailButton addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * leftBarItem = [[UIBarButtonItem alloc] initWithCustomView:detailButton];
    UIBarButtonItem * leftBarSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    leftBarSpacer.width = -10;
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:leftBarSpacer, leftBarItem, nil];
    //self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:detailButton];
    
    UIImageView * titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title"]];
    self.navigationItem.titleView = titleView;
}

- (void)clickButton
{
    XMDetailViewController * dvc = [[XMDetailViewController alloc] init];
    [self.navigationController pushViewController:dvc animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
