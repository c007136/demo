//
//  XMViewController.m
//  JPush_Learn
//
//  Created by jack on 14-8-31.
//  Copyright (c) 2014年 com.mildaily.imobile. All rights reserved.
//

#import "XMViewController.h"
#import "XMDetailViewController.h"
#import "XMNavigationViewController.h"

@interface XMViewController ()

@end

@implementation XMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(100, 150, 100, 30)];
    button.backgroundColor = [UIColor orangeColor];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    _execute = [[XMExecute alloc] init];
    [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(timerFire:) userInfo:nil repeats:YES];
}

- (void)buttonClick
{
//    XMNavigationViewController * nvc = (XMNavigationViewController *)self.navigationController;
//    if ( nvc.message != nil ) {
//        
//        XMDetailViewController * detailVC = [[XMDetailViewController alloc] init];
//        [self.navigationController pushViewController:detailVC animated:YES];
//        //nvc.message = nil;
//        
//    }
    
//    XMDetailViewController * detailVC = [[XMDetailViewController alloc] init];
//    [self.navigationController pushViewController:detailVC animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)timerFire:(NSTimer *)timer
{
    if ( _message != nil ) {
        [_execute execute:_message viewController:self];
        _message = nil;
    }
}

@end
