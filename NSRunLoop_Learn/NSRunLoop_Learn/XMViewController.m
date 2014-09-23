//
//  XMViewController.m
//  NSRunLoop_Learn
//
//  Created by jack on 14-8-15.
//  Copyright (c) 2014年 com.yuzhuangbao.xiaomi. All rights reserved.
//

#import "XMViewController.h"

@interface XMViewController ()
{
    BOOL          _loading;
}

@end

@implementation XMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 100, 50)];
    button.backgroundColor = [UIColor orangeColor];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    _loading = NO;
}

- (void)buttonClick:(UIButton *)sender
{
    [sender setSelected:YES];
    
    NSLog(@"*** main loop begin ***");
    
    [[NSRunLoop mainRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];
    
    NSLog(@"*** main loop end ***");
    
    _loading = YES;
    [NSThread detachNewThreadSelector:@selector(loading:) toTarget:self withObject:nil];
    
    while (_loading) {
        [[NSRunLoop currentRunLoop] runMode:UITrackingRunLoopMode beforeDate:[NSDate distantFuture]];
        NSLog(@"*** while end***");
    }
    
    NSLog(@"*** press over ***");
}

- (void)loading:(id)sender
{
    sleep(3);
    
    NSLog(@"*** loading ***");
    
    _loading = NO;
}

@end
