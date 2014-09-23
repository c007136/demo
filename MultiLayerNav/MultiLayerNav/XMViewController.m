//
//  XMViewController.m
//  MultiLayerNav
//
//  Created by jack on 14-8-12.
//  Copyright (c) 2014年 com.yuzhuangbao.xiaomi. All rights reserved.
//

#import "XMViewController.h"

@interface XMViewController ()

@end

@implementation XMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 280, 280)];
    label.text = [NSString stringWithFormat:@"%ld",self.navigationController.viewControllers.count];
    label.font = [UIFont systemFontOfSize:250];
    label.textColor = [UIColor purpleColor];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(50, 240, 220, 50)];
    [button setBackgroundColor:[UIColor grayColor]];
    [button setTitle:@"Push a new controller" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    if (self.navigationController.viewControllers.count > 1) {
        self.title = [NSString stringWithFormat:@"multi nav(%ld)",
                      self.navigationController.viewControllers.count];
    }else{
        self.title = [NSString stringWithFormat:@"multi nav"];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)pressBtn:(UIButton *)sender
{
    XMViewController * vc = [[XMViewController alloc] init];
    vc.title = self.title;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
