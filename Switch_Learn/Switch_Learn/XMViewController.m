//
//  XMViewController.m
//  Switch_Learn
//
//  Created by jack on 14-8-17.
//  Copyright (c) 2014年 com.yuzhuangbao.xiaomi. All rights reserved.
//

#import "XMViewController.h"

@interface XMViewController ()

@end

@implementation XMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UISwitch * swich = [[UISwitch alloc] initWithFrame:CGRectMake(50, 50, 0, 0)];
    [swich addTarget:self action:@selector(switchClick:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:swich];
}

- (void)switchClick:(UISwitch *)sender
{
    if ( sender.isOn ) {
        NSLog(@"switch is on.....");
    } else {
        NSLog(@"switch is of.....");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
