//
//  XMViewController.m
//  NSDate_Learn
//
//  Created by jack on 14-8-30.
//  Copyright (c) 2014年 com.yuzhuangbao.xiaomi. All rights reserved.
//

#import "XMViewController.h"

@interface XMViewController ()
{
    NSInteger      _updateCount;
}

@end

@implementation XMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSTimeInterval time = [[NSDate date] timeIntervalSince1970];
    NSLog(@"time %lf", time);
    
    //_updateCount = 0;
    //[NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(timerFire:) userInfo:nil repeats:YES];
}

- (void)timerFire:(NSTimer *)timer
{
    _updateCount ++;
    
    NSTimeInterval time = [[NSDate date] timeIntervalSince1970];
    NSLog(@"time interval : %f update count : %ld", time, _updateCount);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
