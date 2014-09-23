//
//  XMViewController.m
//  FastAnimationWithPop
//
//  Created by jack on 14-8-15.
//  Copyright (c) 2014年 com.yuzhuangbao.xiaomi. All rights reserved.
//

#import "XMViewController.h"
#import "XMAnimationView.h"

@interface XMViewController ()
{
    XMAnimationView            * _view;
}

@end

@implementation XMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    _view = [[XMAnimationView alloc] initWithFrame:CGRectMake(50, 100, 125, 50)];
    [self.view addSubview:_view];
    
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(50, 200, 100, 50)];
    button.tag = 1;
    button.backgroundColor = [UIColor brownColor];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton * button2 = [[UIButton alloc] initWithFrame:CGRectMake(180, 200, 100, 50)];
    button2.tag = 2;
    button2.backgroundColor = [UIColor brownColor];
    [button2 addTarget:self action:@selector(button2Click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
}

- (void)buttonClick
{
    //[self fadeIn:_view andAnimationDuration:5 andWait:YES];
    [self moveLeft:_view andAnimationDuration:5 andWait:YES andLength:-50];
}

- (void)button2Click
{
    NSDate * date = [NSDate dateWithTimeIntervalSinceNow:-60*60];
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSLog(@"date %@", [formatter stringFromDate:date]);
}

- (void)fadeIn: (UIView *)view andAnimationDuration: (float) duration andWait:(BOOL) wait
{
    __block BOOL done = wait;
    [view setAlpha:0.0];
    [UIView animateWithDuration:duration animations:^{
        [view setAlpha:1.0];
    } completion:^(BOOL finished) {
        done = NO;
    }];

    while (done == YES)
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.01]];
}

- (void)moveLeft: (UIView *)view andAnimationDuration: (float) duration andWait:(BOOL) wait andLength:(float) length{
    
    __block BOOL done = wait;
    [UIView animateWithDuration:duration animations:^{
        
        view.center = CGPointMake(view.center.x - length, view.center.y);
        
    } completion:^(BOOL finished) {
        done = NO;
    }];
    
    while (done == YES)
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.01]];
}


@end
