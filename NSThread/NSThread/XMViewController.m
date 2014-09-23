//
//  XMViewController.m
//  NSThread
//
//  Created by jack on 14-9-1.
//  Copyright (c) 2014年 com.yuzhuangbao.xiaomi. All rights reserved.
//

#import "XMViewController.h"

@interface XMViewController ()

@end

@implementation XMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(50, 150, 100, 50)];
    button.backgroundColor = [UIColor orangeColor];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonClick:(UIButton *)sender
{
    BOOL b = [NSThread isMainThread];
    NSLog(@"main thread ..... %d", b);
    
    [NSThread detachNewThreadSelector:@selector(loading:) toTarget:self withObject:nil];
}

- (void)loading:(id)sender
{
    BOOL b = [NSThread isMainThread];
    NSLog(@"other thread ..... %d", b);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
