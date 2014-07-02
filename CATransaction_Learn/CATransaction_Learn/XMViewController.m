//
//  XMViewController.m
//  CATransaction_Learn
//
//  Created by jack on 14-7-2.
//  Copyright (c) 2014年 com.yuzhuangbao.xiaomi. All rights reserved.
//

// 事务学习
// http://www.cnblogs.com/bandy/archive/2012/03/26/2418165.html

#import "XMViewController.h"

@interface XMViewController ()
{
    CALayer   * _Layer;
}

@end

@implementation XMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    _Layer = [CALayer layer];
    _Layer.bounds = CGRectMake(0, 0, 200, 200);
    _Layer.position = CGPointMake(160, 250);
    _Layer.backgroundColor = [UIColor redColor].CGColor;
    _Layer.borderColor = [UIColor blackColor].CGColor;
    _Layer.opacity = 1.0f;
    [self.view.layer addSublayer:_Layer];
    
    UIButton * button = [[UIButton alloc] init];
    button.frame = CGRectMake(30, 100, 100, 30);
    button.backgroundColor = [UIColor blueColor];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonClick
{
    // 显式事务
    // 通过明确的begin commit来提交动画
    [CATransaction begin];
    [CATransaction setValue:(id)kCFBooleanFalse forKey:kCATransactionDisableActions];
    [CATransaction setValue:[NSNumber numberWithFloat:5.0f] forKey:kCATransactionAnimationDuration];
    _Layer.cornerRadius = (_Layer.cornerRadius == 0.0f) ? 30.0f : 0.0f;
    _Layer.opacity = (_Layer.opacity == 1.0f) ? 0.5f : 1.0f;
    [CATransaction commit];
    
//    // 隐式事务
//    [CATransaction setDisableActions:NO];
//    _Layer.cornerRadius = (_Layer.cornerRadius == 0.0f) ? 30.0f : 0.0f;
//    _Layer.opacity = (_Layer.opacity == 1.0f) ? 0.5f : 1.0f;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

@end
